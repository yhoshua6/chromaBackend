class CreateGroupsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_users, id: :uuid do |t|
      t.uuid :group_id
      t.uuid :user_id

      t.timestamps
    end
  end
end
