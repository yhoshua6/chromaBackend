class CreateBranchRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :branch_roles, id: :uuid do |t|
      t.uuid :branch_id
      t.uuid :sender_id
      t.uuid :receiver_id

      t.timestamps
    end
  end
end
