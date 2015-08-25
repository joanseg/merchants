class AddLocationToMerchant < ActiveRecord::Migration
  def change
    add_column :merchants, :latitud, :decimal
    add_column :merchants, :longitud, :decimal
    add_column :merchants, :placeid, :string
  end
end
