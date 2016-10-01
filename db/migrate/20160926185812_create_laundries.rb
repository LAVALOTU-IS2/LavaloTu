class CreateLaundries < ActiveRecord::Migration[5.0]
  def change
    create_table :laundries do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.float :score

      t.timestamps
    end
  end
end
