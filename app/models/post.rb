class Post < ApplicationRecord
  # relationships
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy

  # enum for status
  enum status: { joined: 0, approved: 1, published: 2 }

end
