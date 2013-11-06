class EztvItems < ActiveRecord::Base
  validates_presence_of :show_name
  validates_inclusion_of :season, in: (1..99)
  validates_inclusion_of :episode, in: (1..9999)
  validates_format_of :link, with: /http:\/\/.*.torrent/
end
