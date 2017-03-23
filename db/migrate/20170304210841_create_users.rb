class CreateUsers < ActiveRecord::Migration[5.0]
  enable_extension 'uuid-ossp'
  def change
    create_table :users, id: :uuid do |t|
      t.uuid :info_id
      t.uuid :notifications_role
      t.uuid :group_users_id
      t.uuid :branch_role
      t.string :role
      t.string :user
      t.string :password_digest
      t.string :confirmation_token

      t.timestamps
    end
  end
end
