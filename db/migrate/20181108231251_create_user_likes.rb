class CreateUserLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_likes, id: :uuid do |t|
      t.references :post, foreign_key: true, type: :uuid
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
