class CreateUsersRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :users_roles, id: :uuid do |t|
      t.string :role

      t.timestamps
    end
  end
end
