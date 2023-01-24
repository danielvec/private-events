require 'rails_helper'

RSpec.describe 'Creating an event', type: :system do
  scenario 'valid inputs' do
    login_as(create(:user))
    visit new_event_path
    fill_in 'event[title]', with: 'Rails Conference'
    fill_in 'event[date]', with: '08160020231800'
    fill_in 'event[location]', with: 'Los Angeles'
    click_on 'Submit'

    expect(page).to have_content('Rails Conference')
    expect(page).to have_content('Wed, Aug 16, 6:00 PM')
    expect(page).to have_content('Los Angeles')
  end

  scenario 'invalid inputs' do
    login_as(create(:user))
    visit new_event_path
    click_on 'Submit'

    message = page.find("#event_title").native.attribute("validationMessage")
    expect(message).to eq('Please fill out this field.')
  end
end
