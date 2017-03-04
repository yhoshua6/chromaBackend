class CreateDepotFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :depot_files, id: :uuid do |t|
      t.uuid :owner_id
      t.uuid :receiver_id
      t.string :path_file
      t.string :file_name
      t.string :type_transaction

      t.timestamps
    end
  end
end
