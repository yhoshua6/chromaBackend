class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :property_info_id

      t.timestamps
    end
  end
end
