class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.decimal :item_price


      t.references :meal, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true

      t.timestamps
    end
  end
end
