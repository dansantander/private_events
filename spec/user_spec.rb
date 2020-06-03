require 'rails_helper'
require_relative '../app/models/user'

RSpec.describe User do
 subject { described_class.create(name: 'Dan', email: 'dan@domain.com') }

  describe 'Signup Values' do
    it 'Should create a new user' do
      expect(subject).to be_valid
    end
  end
end