class Comment < ApplicationRecord
  # relationships
  belongs_to :post
  belongs_to :user
  has_many :replies, dependent: :destroy
end
