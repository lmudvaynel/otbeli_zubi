class AddImageToCertificates < ActiveRecord::Migration
  def self.up
    add_attachment :certificates, :image
    add_column :certificates, :position, :integer
  end

  def self.down
    remove_attachment :certificates, :image
    remove_column :certificates, :position
  end
end
