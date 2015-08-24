class AddFieldsToMerchant < ActiveRecord::Migration
  def change
    add_column :merchants, :body, :text
  end
end
