class CreateAchievements < ActiveRecord::Migration[5.0]
  def change
    create_table :achievements do |t|
      t.string :description
      t.string :benefit
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
