require 'spec_helper'

feature 'visitor sees a list of tv shows' do
  scenario 'user visits root page' do
    FactoryGirl.create(:eztv_item, show_name: "Futurama")
    visit root_path
    expect(page).to have_content("Futurama")
  end
end
