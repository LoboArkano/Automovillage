require_relative '../rails_helper'

RSpec.describe Category, type: :model do
  context 'testing associations' do
    it 'should have many taggings' do
      c = Category.reflect_on_association(:taggings)
      expect(c.macro).to eq(:has_many)
    end
    it 'should have many articles' do
      c = Category.reflect_on_association(:articles)
      expect(c.macro).to eq(:has_many)
    end
  end
end
