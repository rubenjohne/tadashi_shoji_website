class Collection < ActiveRecord::Base
  attr_accessible :collection
  has_many :styles
end
