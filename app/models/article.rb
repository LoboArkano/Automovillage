class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :votes, dependent: :destroy
  has_many :taggings
  has_many :categories, through: :taggings
  has_one_attached :picture

  # validates_acceptance_of :picture, content_type: ['picture/jpg', 'picture/jpeg', 'picture/png']
end
