class Collection < ActiveRecord::Base
  attr_accessible :collection, :video_url, :url
  has_many :styles, :order => "position ASC"
  
  # validations 
  validates :collection, :presence => true
  validates :url, :presence => true, :uniqueness => {:case_sensitive => false}
  
  def has_video?
    video_url != '' && !video_url.nil?
  end

  
end
