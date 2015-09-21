class AddImagenameToMeal < ActiveRecord::Migration
  def change
    add_column :meals, :image_name, :string
  end
end
