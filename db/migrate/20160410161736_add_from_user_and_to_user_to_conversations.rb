class AddFromUserAndToUserToConversations < ActiveRecord::Migration
  def change
    add_column :mailboxer_conversations, :from_user, :integer
    add_column :mailboxer_conversations, :to_user, :integer
  end
end
