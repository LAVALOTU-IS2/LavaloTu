class CreateGarments < ActiveRecord::Migration[5.0]
  def change
    create_table :garments do |t|
      t.string :name
      t.integer :quantity
      t.text :description

      t.timestamps
    end
  end
end
