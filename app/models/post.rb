class Post < ApplicationRecord
  # relationships
  belongs_to :category, counter_cache: true
  belongs_to :user, counter_cache: true
  has_many :comments, dependent: :destroy
  has_many :user_likes, dependent: :destroy
  has_many :users, through: :user_likes
  
  # enum for status
  enum status: { draft: 0, published: 1 }

end
