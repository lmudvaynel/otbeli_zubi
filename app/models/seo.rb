class Seo < ActiveRecord::Base
  attr_accessible :title, :keywords, :description

  has_one :page
end
