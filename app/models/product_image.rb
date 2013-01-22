class ProductImage < ActiveRecord::Base
  attr_accessible :image_filename, :image_type, :label, :style_id
  belongs_to :style
  # validations
  validates :image_filename, :presence => true
  validates :image_type, :presence => true
  validates :style_id, :presence => true
  validates_inclusion_of :image_type, :in => 1..3
  
end
