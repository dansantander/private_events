require 'rails_helper'

RSpec.describe Event do
  
  let(:test_user) { User.create(name: 'Example User') }
  let(:subject) do
    described_class.new(
    title: 'new job offer',
    event_date: '2020-08-10',
    creator_id: test_user.id)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a content' do
      subject.event_date = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a creator_id' do
      subject.creator_id = nil
      expect(subject).to_not be_valid
    end

    it 'should not allow a name longer than 100 characters' do
      subject.title = 'a' * 101
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:creator) }
    it { should have_many(:invitees) }
  end
end
