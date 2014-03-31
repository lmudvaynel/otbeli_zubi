class AddBleachImage < ActiveRecord::Migration
  def self.up
    add_attachment :bleach_images, :image
  end

  def self.down
    remove_attachment :bleach_images, :image
  end
end
