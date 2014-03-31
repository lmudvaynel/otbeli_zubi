class News < ActiveRecord::Base
  attr_accessible :content, :published_at, :title

  validates :content, length: { maximum: 300}, presence: true
  validates :published_at, presence: true
end
