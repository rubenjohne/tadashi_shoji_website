class Style < ActiveRecord::Base
  attr_accessible :collection_id, :color_id, :description, :name, :price, :size_id
  has_one :collection
  has_one :size
  has_one :color
  #validations
  validates :name, :presence => true
  validates :price, :presence => true
  validates :collection_id, :presence => true
  validates :color_id, :presence => true
  validates :size_id, :presence => true
  validates :description, :presence => true
  
end
