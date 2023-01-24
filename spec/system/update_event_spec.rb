require 'rails_helper'

RSpec.describe 'Updating an event', type: :system do
  scenario 'valid inputs' do
    @user = create(:user)
    login_as(@user)
    conf = Event.create!(creator: @user, title: 'Rails Conference', date: 'Wed, Aug 16, 6:00 PM', location: 'Los Angeles')
    visit edit_event_path(conf)
    fill_in 'event[title]', with: 'Ruby Conference'
    fill_in 'event[date]', with: '08160020231800'
    fill_in 'event[location]', with: 'Los Angeles'
    click_on 'Submit'

    expect(page).to have_content('Ruby Conference')
    expect(page).to have_content('August 16 2023, 6:00 PM')
    expect(page).to have_content('Los Angeles')
  end
end