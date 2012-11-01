class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email,  :username, :password, :password_confirmation
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :username, :presence => true, 
            :length => {:maximum => 50}
  validates :email, :presence => true, 
            :format => {:with => email_regex}, 
            :uniqueness => {:case_sensitive => false}
  # create the virtual attribute 'password_confirmation'
  # validates :password,  :presence => true,
  #                       :confirmation => true,
  #                       :length => {:within => 6..40}
end
