class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :post_text
      t.integer :favorites, default: 0
      t.boolean :deactivated, default: false
      t.timestamps
    end
  end
end
