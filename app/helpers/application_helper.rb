module ApplicationHelper

  # return a title on a per-page basis
  def title
    base_title ="Tadashi Shoji"
    if @title.nil?
      base_title
    else
      "#{@title} | #{base_title}"
    end
    
  end
  
  
end
