class Retailer < ActiveRecord::Base
  acts_as_gmappable 
  attr_accessible :address1, :address2, :city, :state_id, :store, :zip_code, :country_id, :telephone
  belongs_to :country
  belongs_to :state
  # validations
  validates :store, :presence => true 
  validates :address1, :presence => true
  validates :city, :presence => true 

  
  def gmaps4rails_address
    "#{self.address1} #{self.address2} #{self.city}, #{self.state.state_code unless self.state.nil? } #{self.zip_code} #{self.country.country_name}" 
  end
  
  def gmaps4rails_infowindow
    # OPTIMIZE 
    "<b>#{self.store}</b><br/>#{self.address1}<br/>#{self.address2}  #{'<br/>' unless self.address2 == ''}#{self.city}, #{self.state.state_code unless self.state.nil?} #{self.zip_code}"
  end
  
end
