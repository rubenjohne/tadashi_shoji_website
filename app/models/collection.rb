class Collection < ActiveRecord::Base
  attr_accessible :collection, :video_url
  has_many :styles, :order => "position ASC"
  
  def has_video?
    video_url != '' && !video_url.nil?
  end
  
end
