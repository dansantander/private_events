require 'rails_helper'

RSpec.describe Invitation do

  let(:test_user) { User.create(name: 'Example User') }
  let(:test_event) { Event.create(title: 'Example User') }
  let(:subject) do 
    described_class.new(
      invitee_id: 1,
      attended_event_id: 1,
      confirmation: true
      )
  end

  describe 'Associations' do
    it { should belong_to(:invitee) }
    it { should belong_to(:attended_event) }
  end

end