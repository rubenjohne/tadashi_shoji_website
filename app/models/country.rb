class Country < ActiveRecord::Base
  attr_accessible :country_name, :international
  validates :country_name, :presence => true
  has_many :states
  has_many :retailers 
end
