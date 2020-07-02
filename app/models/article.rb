class Article < ApplicationRecord
  belongs_to :author, classname: 'User'
  has_many :votes, dependent: :destroy
  has_many :taggings
  has_many :categories, through: :taggings
  has_attached_file :image
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']
end
