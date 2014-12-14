class CreateFavoritesAndReports < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end

    create_table :reports do |t|
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
  end
end
