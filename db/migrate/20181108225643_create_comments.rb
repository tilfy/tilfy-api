class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments, id: :uuid do |t|
      t.text :content
      t.references :post, foreign_key: true, type: :uuid
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
