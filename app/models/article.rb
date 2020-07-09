class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :votes, dependent: :destroy
  has_many :taggings
  has_many :categories, through: :taggings
  has_one_attached :image

  validates_acceptance_of :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']
end
