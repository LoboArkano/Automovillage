class Article < ApplicationRecord
  belongs_to :author, classname: 'User'
  has_many :votes, dependent: :destroy
  has_many :taggings
  has_many :categories, through: :taggings
end
