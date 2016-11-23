class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.integer :direction
      t.datetime :deliver_date
      t.references :order, foreign_key: true
      t.references :deliverer, foreign_key: true
      t.references :place, foreign_key: true
      
      t.timestamps
    end
  end
end
