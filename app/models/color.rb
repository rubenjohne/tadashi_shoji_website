class Color < ActiveRecord::Base
  attr_accessible :color_code, :color_name
  has_many :styles
end
