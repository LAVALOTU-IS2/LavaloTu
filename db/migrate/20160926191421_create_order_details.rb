class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.string :description
      t.integer :quantity
      t.float :cost
      t.string :service_name
      t.references :order, foreign_key: true
      t.references :garment, foreign_key: true

      t.timestamps
    end
  end
end
