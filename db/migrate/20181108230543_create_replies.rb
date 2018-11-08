class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies, id: :uuid do |t|
      t.text :content
      t.references :user, foreign_key: true, type: :uuid
      t.references :comment, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
