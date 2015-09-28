class AddAcceptedDateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :accepted_date, :datetime
  end
end
