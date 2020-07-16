class User < ApplicationRecord
  has_many :articles, foreign_key: 'author_id'
  has_many :votes

  validates :name, presence: true, length: { in: 1..12 }
end
