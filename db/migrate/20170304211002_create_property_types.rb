class CreatePropertyTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :property_types, id: :uuid do |t|
      t.string :property_type

      t.timestamps
    end
  end
end
