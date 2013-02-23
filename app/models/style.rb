class Style < ActiveRecord::Base
  attr_accessible :collection_id, :color_id, :description, :name, :price, :size_id, :position
  attr_accessible :picture
  belongs_to :collection
  has_one :size
  has_one :color
  has_many :product_images 
  #validations
  validates :name, :presence => true
  validates :price, :presence => true
  validates :collection_id, :presence => true
  validates :color_id, :presence => true
  validates :size_id, :presence => true
  validates :description, :presence => true
  validates :position, :numericality => { :only_integer => true }
  
  # paperclip related properties
  has_attached_file :picture, styles: {
    base: '1200x1800>',
    small: '220x330>',
    thumbnail: '120x180>',
    grid: '192x288>',
    popup: '400x600>',
    mini: '42x63>'
  }
  
end
