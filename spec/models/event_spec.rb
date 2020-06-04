require 'rails_helper'

RSpec.describe Event do
  subject { described_class.create(title: 'new job offer', event_date: '2020-08-10') }

  describe 'Event Creation Values' do
    it 'Should create a valid event data' do
      expect(subject).to_not be_valid
    end
  end
end
