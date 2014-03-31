class Template < ActiveRecord::Base
  attr_accessible :content, :name
  validates :name, presence: true, uniqueness: true
end
