class AddDeliverersIdToUser < ActiveRecord::Migration[5.0]
  def change
  	add_reference :users, :deliverers, foreign_key: true, null: true
  end
end
