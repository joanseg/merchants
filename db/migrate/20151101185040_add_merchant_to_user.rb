class AddMerchantToUser < ActiveRecord::Migration
  def change
    add_reference :users, :merchant, index: true
  end
end
