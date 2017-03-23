class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications, id: :uuid do |t|
      t.uuid :user_id
      t.string :title
      t.text :content
      t.string :receiver_user
      t.uuid :notifications_roles_id

      t.timestamps
    end
  end
end
