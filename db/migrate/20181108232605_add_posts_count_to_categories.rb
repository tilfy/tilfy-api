class AddPostsCountToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :posts_count, :integer, default: 0, null: false
  end
end
