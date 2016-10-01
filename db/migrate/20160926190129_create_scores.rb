class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.string :comment
      t.integer :grade
      t.references :laundries, foreign_key: true

      t.timestamps
    end
  end
end
