class CreateBranchRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :branch_roles do |t|
      t.uuid :sender_id
      t.uuid :receiver_id
      t.uuid :branch_id

      t.timestamps
    end
  end
end
