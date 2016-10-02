class AddImageToGarments < ActiveRecord::Migration[5.0]
  def change
    add_column :garments, :image, :string
  end
end
