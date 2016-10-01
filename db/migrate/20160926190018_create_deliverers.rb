class CreateDeliverers < ActiveRecord::Migration[5.0]
  def change
    create_table :deliverers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.references :laundries, foreign_key: true

      t.timestamps
    end
  end
end
