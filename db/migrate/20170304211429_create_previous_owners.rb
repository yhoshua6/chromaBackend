class CreatePreviousOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :previous_owners, id: :uuid do |t|
      t.uuid :property_id
      t.uuid :owner_id

      t.timestamps
    end
  end
end
