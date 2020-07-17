require_relative '../rails_helper'

RSpec.describe Tagging, type: :model do
  context 'testing associations' do
    it 'should have one article' do
      t = Tagging.reflect_on_association(:article)
      expect(t.macro).to eq(:belongs_to)
    end
    it 'should have one category' do
      t = Tagging.reflect_on_association(:category)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
