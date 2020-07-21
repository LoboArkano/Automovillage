class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :votes, dependent: :destroy
  has_many :taggings
  has_many :categories, through: :taggings
  has_one_attached :picture

  validates :title, presence: true, length: { in: 1..80 }
  validates :text, presence: true
end
