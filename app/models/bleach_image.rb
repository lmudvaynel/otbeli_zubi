class BleachImage < ActiveRecord::Base
  attr_accessible :image, :price
  
  has_attached_file :image

  belongs_to :page

  validates_attachment_presence :image
  validates_attachment_content_type :image,:content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
  validates_attachment_size :image,:less_than => 5.megabytes
end
