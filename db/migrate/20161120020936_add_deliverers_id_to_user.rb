class AddDeliverersIdToUser < ActiveRecord::Migration[5.0]
  def change
  	add_reference :users, :deliverer, foreign_key: true, null: true
  end
end
