class CambioColumna < ActiveRecord::Migration[5.0]
  def change
  	rename_column :achievements, :users_id, :user_id
  	rename_column :orders, :users_id, :user_id
  	rename_column :deliverers, :laundries_id, :laundry_id
  	rename_column :deliveries, :deliverers_id, :deliverer_id
  	rename_column :deliveries, :orders_id, :order_id
  	rename_column :order_details, :orders_id, :order_id
  	rename_column :order_details, :garments_id, :garment_id
  	rename_column :orders, :laundries_id, :laundry_id
  	rename_column :scores, :laundries_id, :laundry_id
  	rename_column :services, :laundries_id, :laundry_id


  end
end
