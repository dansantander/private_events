require 'rails_helper'

RSpec.describe Event do
  #before { sign_in }
 subject { described_class.create(title: 'new job offer', event_date: '2020-08-10') }
 
 describe 'Event Creation Values' do
  it 'Should create a valid event data' do
    # :event.title = nil
    expect(subject).to_not be_valid
  end

=begin   def sign_in
    user = User.create(name: 'Tester', email: 'test@domain.com')
    puts "#{user} >>>"
    visit signin_path
    fill_in 'private_event_user_id', with: user.id
    click_button 'Submit'
  end
=end
  

  end
end