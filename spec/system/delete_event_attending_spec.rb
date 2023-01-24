require 'rails_helper'

RSpec.describe 'Deleting an event attending', type: :system do
  scenario 'success' do
    @user = create(:user)
    login_as(@user)
    conf = Event.create!(creator: @user, title: 'Rails Conference', date: 'Wed, Aug 16, 6:00 PM', location: 'Los Angeles')
    visit event_path(conf)
    find('.reserve-button').click
    sleep 0.1
    find('.reserve-button').click
    accept_alert
    expect(page).not_to have_content(@user.email)
  end
end