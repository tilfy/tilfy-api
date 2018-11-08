class UserLike < ApplicationRecord
  # relationships
  belongs_to :post
  belongs_to :user
end
