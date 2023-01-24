require 'rails_helper'

RSpec.describe 'Creating an event attending', type: :system do
  scenario 'valid inputs' do
    @user = create(:user)
    login_as(@user)
    conf = Event.create!(creator: @user, title: 'Rails Conference', date: 'Wed, Aug 16, 6:00 PM', location: 'Los Angeles')
    visit event_path(conf)
    find('.reserve-button').click
    expect(page).to have_content(@user.email)
    find('.attendee').click
    expect(page).to have_content(conf.title)
  end
end