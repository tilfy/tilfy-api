class Post < ApplicationRecord
  # relationships
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :user_likes, dependent: :destroy
  has_many :users, through: :user_likes
  
  # enum for status
  enum status: { joined: 0, published: 1, rejected: 2 }

end
