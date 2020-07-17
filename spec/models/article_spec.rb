require_relative '../rails_helper'

RSpec.describe Article, type: :model do
  context 'creating article' do
    it 'article cannot be blank ' do
      expect { Article.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'title cannot be blank ' do
      art = Article.new(title: '', text: 'Text test', author_id: 1)
      expect { art.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'text cannot be blank ' do
      art = Article.create(title: 'Title test', text: '', author_id: 1)
      expect { art.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'check author name' do
    let(:user) { User.create(name: 'Jenifer') }
    let(:article) { Article.create(title: 'Title test', text: 'Text test', author_id: user.id) }
    it 'article has author Triss' do
      expect(article.author.name).to eql('Jenifer')
    end
  end

  context 'testing associations' do
    it 'should have one author' do
      a = Article.reflect_on_association(:author)
      expect(a.macro).to eq(:belongs_to)
    end
    it 'should have many votes' do
      a = Article.reflect_on_association(:votes)
      expect(a.macro).to eq(:has_many)
    end
    it 'should have many taggings' do
      a = Article.reflect_on_association(:taggings)
      expect(a.macro).to eq(:has_many)
    end
    it 'should have many categories' do
      a = Article.reflect_on_association(:categories)
      expect(a.macro).to eq(:has_many)
    end
  end
end
