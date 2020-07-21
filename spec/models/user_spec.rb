require_relative '../rails_helper'

RSpec.describe User, type: :model do
  context 'Creating user' do
    it 'name cannot be blank ' do
      expect { User.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'User can create articles' do
    let(:user) { User.create(name: 'Triss') }
    let(:article) { Article.create(title: 'Title test', text: 'Text test', author_id: user.id) }
    it 'article has author Triss' do
      expect(article.author.name).to eql('Triss')
    end
    it 'article has a title' do
      expect(article.title).to eql('Title test')
    end
    it 'article has a text' do
      expect(article.text).to eql('Text test')
    end
  end

  context 'testing associations' do
    it 'should have many articles' do
      u = User.reflect_on_association(:articles)
      expect(u.macro).to eq(:has_many)
    end
    it 'should have many votes' do
      u = User.reflect_on_association(:votes)
      expect(u.macro).to eq(:has_many)
    end
  end
end
