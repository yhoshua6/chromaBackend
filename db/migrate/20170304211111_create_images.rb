class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images, id: :uuid do |t|
      t.uuid :owner_id
      t.string :path
      t.boolean :profile

      t.timestamps
    end
  end
end
