class Reply < ApplicationRecord
  # relationships
  belongs_to :user
  belongs_to :comment
end
