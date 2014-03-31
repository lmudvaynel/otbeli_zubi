class Page < ActiveRecord::Base
  attr_accessible :slug, :seo_id, :left_content, :seo_attributes,
                  :position, :name, :right_content, :parent_id, :bleach_images_attributes

  belongs_to :seo
  has_many :bleach_images

  acts_as_list

  accepts_nested_attributes_for :seo, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :bleach_images, :allow_destroy => true, :reject_if => :all_blank

  validates :slug, presence: true, uniqueness: true
  validates :name, presence: true
  validates :left_content, html: true
  validates :right_content, html: true

  extend FriendlyId
  friendly_id :slug

  default_scope order('position')

end
