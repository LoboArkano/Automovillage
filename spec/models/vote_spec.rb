require_relative '../rails_helper'

RSpec.describe Vote, type: :model do
  context 'testing associations' do
    it 'should have one user' do
      v = Vote.reflect_on_association(:user)
      expect(v.macro).to eq(:belongs_to)
    end
    it 'should have one friend' do
      v = Vote.reflect_on_association(:article)
      expect(v.macro).to eq(:belongs_to)
    end
  end
end
