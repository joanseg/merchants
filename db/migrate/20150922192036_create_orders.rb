class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :other_amount
      t.references :user, index: true

      t.timestamps
    end
  end
end
