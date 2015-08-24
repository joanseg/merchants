class AddFieldToMerchant < ActiveRecord::Migration
  def change
    add_column :merchants, :avgprice, :decimal
  end
end
