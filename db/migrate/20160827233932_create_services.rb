class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.float :cost

      t.timestamps
    end
  end
end
