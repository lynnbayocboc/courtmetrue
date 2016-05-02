class AddEnableMessageNotificationAndEnableFavouriteNotificationAndEnableViewedByNotificationToUser < ActiveRecord::Migration
  def change
    add_column :users, :enable_message_notification, :boolean
    add_column :users, :enable_favourite_notification, :boolean
    add_column :users, :enable_viewed_by_notification, :boolean
  end
end
