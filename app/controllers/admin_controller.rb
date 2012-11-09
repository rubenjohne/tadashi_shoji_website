class AdminController < ApplicationController
  before_filter :authenticate
  protect_from_forgery
  include SessionsHelper
  
  private 
  
    def authenticate 
      deny_access unless signed_in?
    end

end
