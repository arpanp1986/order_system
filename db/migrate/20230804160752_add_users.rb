class AddUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, limit: 50
      t.string :last_name, null: false, limit: 50
      t.string :email, unique: true, null: false, limit: 50
      t.string :phone_number, null: false, limit: 12
      t.boolean :registered, default: false
      t.boolean :active, default: true

      t.timestamps
    end

    create_table :addresses do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :address_1, null: false, limit: 100
      t.string :address_2, limit: 100
      t.string :state, null: false
      t.string :zip_code, null: false, limit: 9
      t.string :country, null: false
      t.integer :address_type_id, null: false
      t.boolean :active, default: true

      t.timestamps
    end

    create_table :address_types do |t|
      t.string :name

      t.timestamps
    end
    add_foreign_key :addresses, :address_types, column: :address_type_id
  end
end
