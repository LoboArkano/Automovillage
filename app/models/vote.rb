class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article, counter_cache: :total_votes
end
