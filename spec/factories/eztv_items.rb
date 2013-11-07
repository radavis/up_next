# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :eztv_item, :class => 'EztvItems' do
    show_name "Futurama"
    episode_title "Reincarnation"
    season 7
    episode 26
    link "http://torrent.zoink.it/Futurama.S07E26.HDTV.x264-2HD.[eztv].torrent"
    description "A 3-segment episode, each with a different type of animation."
    comments "Good News, Everyone!"
    category "TV Shows"
    guid "http://eztv.it/ep/47584/futurama-s07e26-hdtv-x264-2hd/"
  end
end
