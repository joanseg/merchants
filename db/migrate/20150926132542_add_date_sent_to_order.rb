class AddDateSentToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :sent_date, :datetimeu
  end
end
