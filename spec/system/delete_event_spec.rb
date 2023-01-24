require 'rails_helper'

RSpec.describe 'Deleting an event', type: :system do
  scenario 'success' do
    @user = create(:user)
    login_as(@user)
    conf = Event.create!(creator: @user, title: 'Rails Conference', date: 'Wed, Aug 16, 6:00 PM', location: 'Los Angeles')
    visit event_path(conf)
    find('.delete-icon').click
    accept_alert
    expect(page).not_to have_content('Ruby Conference')
    expect(page).not_to have_content('August 16 2023, 6:00 PM')
    expect(page).not_to have_content('Los Angeles')
  end
end