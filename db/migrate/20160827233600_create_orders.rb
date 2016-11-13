class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.datetime :d_finished
      t.string :status
      t.integer :score
      t.text :comment

      t.timestamps
    end
  end
end
