class Collection < ActiveRecord::Base
  attr_accessible :collection, :video_url
  has_many :styles, :order => "position ASC"
end
