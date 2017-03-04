class CreateNotificationsRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications_roles, id: :uuid do |t|
      t.uuid :notification_id
      t.uuid :receiver_id

      t.timestamps
    end
  end
end
