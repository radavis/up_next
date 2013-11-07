require 'simple-rss'
require 'open-uri'

class EztvItems < ActiveRecord::Base
  validates_presence_of :show_name
  validates_inclusion_of :season, in: (1..99)
  validates_inclusion_of :episode, in: (1..9999)
  validates_format_of :link, with: /http:\/\/.*.torrent/

  def self.channels
    %w{ BBC Ch4 PBS CBC }
  end

  def self.update_from_rss
    # try to open the feed, log if fails
    begin
      xml = open('http://ezrss.it/feed/')
    rescue Exception => e
      logger.error "Problem opening RSS feed: #{e.message}"
    end

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
          season: description['season'],
          episode: description['episode'],
          link: item.link,
          description: item.description,
          comments: item.comments,
          category: item.category,
          guid: item.guid,
          created_at: item.pubDate,
          channel: description['channel'],
          episode_date: description['episode date']
        )

        eztv_item.save
        logger.info "EztvItem: #{eztv_item.show_name} #{eztv_item.created_at}"
      end
    end
  end

  def show_number
    if season and episode
      return "S%02iE%02i" % [season, episode]
    else
      return episode_date
    end
  end
end
