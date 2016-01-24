class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.boolean :is_favourite

      t.timestamps null: false
    end
  end
end
