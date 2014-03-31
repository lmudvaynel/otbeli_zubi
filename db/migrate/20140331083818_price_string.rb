class PriceString < ActiveRecord::Migration
  def change
    remove_column :bleach_images, :price 
    add_column :bleach_images, :price, :string
  end
end
