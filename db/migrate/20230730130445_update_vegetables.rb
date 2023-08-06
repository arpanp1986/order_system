class UpdateVegetables < ActiveRecord::Migration[7.0]
  def change
    change_column_null :vegetables, :name, false
    change_column_null :vegetables, :price, false
    change_column_null :vegetables, :available, false
  end
end
