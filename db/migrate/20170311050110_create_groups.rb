class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups, id: :uuid do |t|
      t.string :name
      t.uuid :groups_users

      t.timestamps
    end
  end
end
