class AddImageToMerchant < ActiveRecord::Migration
  def change
    add_column :merchants, :image_name, :string
  end
end
