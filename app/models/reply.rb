class Reply < ApplicationRecord
  # relationships
  belongs_to :user
  belongs_to :comment, counter_cache: true
end
