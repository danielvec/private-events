require 'rails_helper'


RSpec.describe 'Creating an event', type: :system do
  scenario 'valid inputs' do
    login_as(create(:user))
    visit new_event_path
    fill_in 'event[title]', with: 'Rails Conference'
    fill_in 'event[date]', with: '08160020231800'
    fill_in 'event[location]', with: 'Los Angeles'
    click_on 'Submit'

    visit events_path
    visit events_path
    expect(page).to have_content('Rails Conference')
  end

  
end