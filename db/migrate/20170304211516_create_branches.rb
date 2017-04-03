class CreateBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :branches, id: :uuid do |t|
      t.string :title
      t.string :branch_type
      t.uuid :property_id

      t.timestamps
    end
  end
end
