class CreateUserActions < ActiveRecord::Migration
  def change
    create_table :user_actions do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.boolean :has_block
      t.boolean :has_report_spam

      t.timestamps null: false
    end
  end
end
