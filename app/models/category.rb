class Category < ApplicationRecord
  has_many :taggings
  has_many :articles, through: :taggings
end
