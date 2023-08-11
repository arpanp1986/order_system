class UniqueAddressType < ActiveRecord::Migration[7.0]
  def change
    add_index :address_types, :name, unique: true
  end
end
