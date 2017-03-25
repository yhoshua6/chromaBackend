class CreateBranchesRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :branches_roles, id: :uuid do |t|
      t.uuid :branch_id
      t.uuid :sender_id
      t.uuid :receiver_id
      t.string :branch_type

      t.timestamps
    end
  end
end
