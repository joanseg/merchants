class AddPriceandordersToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :price, :decimal
    add_column :meals, :orders, :integer
  end
end
