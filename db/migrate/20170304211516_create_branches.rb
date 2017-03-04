class CreateBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :branches, id: :uuid do |t|
      t.string :title
      t.string :branch_type
      t.string :sender_name
      t.string :receiver_name
      t.uuid :property_type_id
      t.uuid :property_id
      t.uuid :sender_id
      t.uuid :receiver_id

      t.timestamps
    end
  end
end
