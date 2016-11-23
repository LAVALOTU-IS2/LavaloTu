class AddLaundryIdToUser < ActiveRecord::Migration[5.0]
  def change
  	add_reference :users, :laundry, foreign_key: true, null: true
  end
end