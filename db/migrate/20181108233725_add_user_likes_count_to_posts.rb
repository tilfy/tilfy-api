class AddUserLikesCountToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :user_likes_count, :integer, default: 0, null: false
  end
end
