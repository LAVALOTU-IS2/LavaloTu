class AddValuesToDeliveries < ActiveRecord::Migration[5.0]
  def change
    add_column :deliveries, :direction, :string
    add_column :deliveries, :time_pickup, :datetime
    add_column :deliveries, :time_deliver, :datetime
    add_reference :deliveries, :deliverers, foreign_key: true
    add_reference :deliveries, :orders, foreign_key: true
  end
end
