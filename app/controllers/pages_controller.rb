class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def collections
    @title = "Collections"
  end
end
