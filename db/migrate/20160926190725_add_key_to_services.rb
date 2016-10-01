class AddKeyToServices < ActiveRecord::Migration[5.0]
  def change
    add_reference :services, :laundries, foreign_key: true
  end
end
