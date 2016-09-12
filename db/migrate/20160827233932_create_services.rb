class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.float :cost
      t.references :garment, foreign_key: true
      t.timestamps
    end
  end
end
