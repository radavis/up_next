# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'simple-rss'
require 'open-uri'

begin
  xml = open('http://ezrss.it/feed/')
rescue SocketError => e
  puts e.message
end

channels = %w{ BBC Ch4 PBS CBC }

if xml
  rss = SimpleRSS.parse(xml)
  rss.items.each do |item|
    
    description = {}
    item.description.split('; ').each do |data|
      k, v = data.split(': ')
      description[k.downcase] = v
    end

    if channels.include?(description['show name'].split.first)
      description["channel"] = description['show name'].split.first
      description["show name"] = description['show name'][4..-1]
    end

    description['episode title'] = nil if description['episode title'] == "N/A"

    eztv_item = EztvItems.find_or_create_by(
      show_name: description['show name'],
      episode_title: description['episode title'],
      link: item.link,
      description: item.description,
      comments: item.comments,
      category: item.category,
      guid: item.guid,
      created_at: item.pubDate
    )

    eztv_item.channel = description['channel'] if description['channel']
    eztv_item.season = description['season'] if description['season']
    eztv_item.episode = description['episode'] if description['episode']
    eztv_item.save

    Rails.logger.info "EztvItem: #{eztv_item.show_name} #{eztv_item.created_at}"
  end
end
