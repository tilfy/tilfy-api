class Category < ApplicationRecord
  # relationships
  has_many :posts, dependent: :destroy
end
