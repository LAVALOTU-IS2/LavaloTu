class AddValuesToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :date_pickup, :datetime
    add_column :orders, :date_deliver, :datetime
    add_column :orders, :total_cost, :float
    add_reference :orders, :users, foreign_key: true
    add_reference :orders, :laundries, foreign_key: true
  end
end
