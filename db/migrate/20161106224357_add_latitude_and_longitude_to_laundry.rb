class AddLatitudeAndLongitudeToLaundry < ActiveRecord::Migration[5.0]
  def change
    add_column :laundries, :latitude, :float
    add_column :laundries, :longitude, :float
  end
end
