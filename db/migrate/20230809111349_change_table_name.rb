class ChangeTableName < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first_name, null: false, limit: 50
      t.string :last_name, null: false, limit: 50
      t.string :email, unique: true, null: false, limit: 50
      t.string :phone_number, null: false, limit: 12
      t.boolean :registered, default: false
      t.boolean :active, default: true

      t.timestamps
    end
    add_reference :addresses, :customer, foreign_key: true
    remove_column :addresses, :user_id, :integer
    add_index :customers, :email, unique: true
  end
end
