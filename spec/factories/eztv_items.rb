# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :eztv_item, :class => 'EztvItems' do
    show_name "MyString"
    episode_title "MyString"
    season 1
    episode 1
    link "MyString"
    description "MyString"
    comments "MyString"
    category "MyString"
    guid "MyString"
  end
end
