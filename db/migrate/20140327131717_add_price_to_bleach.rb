class AddPriceToBleach < ActiveRecord::Migration
  def change
    add_column :bleach_images, :price, :integer 
  end
end
