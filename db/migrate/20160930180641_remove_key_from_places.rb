class RemoveKeyFromPlaces < ActiveRecord::Migration[5.0]
  def change
    remove_reference :places, :users, foreign_key: true
  end
end
