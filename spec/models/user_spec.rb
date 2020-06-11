require 'rails_helper'

RSpec.describe User do
  let(:test_user) { User.create(name: 'Example User') }
  let(:subject) do
    described_class.new(
      name: 'user_example',
      email: 'user@email.com'
    )
  end

  describe 'validations' do
    it 'is valid with valid attribute' do
      expect(subject).to be_valid
    end

    it 'should not allow a name longer than 50 characters' do
      subject.name = 'a' * 51
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:created_events) }
    it { should have_many(:attended_events) }
  end
end
