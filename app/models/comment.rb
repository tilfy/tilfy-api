class Comment < ApplicationRecord
  # relationships
  belongs_to :post, counter_cache: true
  belongs_to :user
  has_many :replies, dependent: :destroy
end
