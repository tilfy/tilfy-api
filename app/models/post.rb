class Post < ApplicationRecord
  # relationships
  belongs_to :category
  belongs_to :user

  # enum for status
  enum status: { joined: 0, approved: 1, published: 2 }

end
