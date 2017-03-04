class CreateInfoProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :info_properties, id: :uuid do |t|
      t.uuid :property_id
      t.string :property_type
      t.string :name
      t.string :description
      t.decimal :surface_total
      t.decimal :surface_in
      t.decimal :surface_out
      t.string :notes

      t.timestamps
    end
  end
end
