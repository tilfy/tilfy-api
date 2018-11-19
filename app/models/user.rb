class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  include DeviseTokenAuth::Concerns::User
  # relationships
  has_many :posts, dependent: :destroy
end
