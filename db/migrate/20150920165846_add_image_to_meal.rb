class AddImageToMeal < ActiveRecord::Migration
  def change
    add_column :meals, :image, :string
  end
end
