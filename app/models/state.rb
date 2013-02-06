class State < ActiveRecord::Base
  attr_accessible :state, :state_code, :country_id
  # validations
  validates :state_code, :presence => true
  validates :state_code, :length => { :is => 2}
  validates :country_id, :presence => true
  belongs_to :country
  has_many :retailers 
end
