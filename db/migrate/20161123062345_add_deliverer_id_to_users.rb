class AddDelivererIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :deliverer, foreign_key: true
  end
end
