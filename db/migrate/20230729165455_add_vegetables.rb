class AddVegetables < ActiveRecord::Migration[7.0]
  def change
    create_table :vegetables do |t|
      t.string :name
      t.integer :price
      t.boolean :available

       t.timestamps
     end
  end
end
