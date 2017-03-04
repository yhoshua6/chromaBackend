class CreateInfoUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :info_users, id: :uuid do |t|
      t.uuid :user_id
      t.string :name
      t.string :email
      t.string :cellphone
      t.boolean :part_of_pool
      t.string :payment_method
      t.string :bank_name
      t.integer :bank_account
      t.integer :bank_clabe
      t.string :cedula

      t.timestamps
    end
  end
end
