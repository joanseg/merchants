class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.text :body
      t.references :merchant, index: true

      t.timestamps
    end
  end
end
