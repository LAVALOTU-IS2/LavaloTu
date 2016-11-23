class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.datetime :pickup_date
      t.datetime :deviler_date
      t.float :total_cost
      t.string :status
      t.integer :score
      t.datetime :date_finished
      t.text :comment
      t.references :user, foreign_key: true
      t.references :laundry, foreign_key: true

      t.timestamps
    end
  end
end
