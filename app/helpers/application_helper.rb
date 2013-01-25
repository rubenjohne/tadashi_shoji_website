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
  
  # return collection drop down information
  def collection_links
    # pending to do later to show collection navigation links from here
    html = '<ul>
			<li><a href="#">FW 2012 FASHION SHOW</a></li>
			<li><a href="#">FW 2012 RUNWAY</a></li>
			<li><a href="#">FW 2012 COLLECTION</a></li>
			<li>
				<a href="#">ARCHIVE</a>
				<ul>
					<li><a href="#">SS 2012 FASHION SHOW</a></li>
					<li><a href="#">SS 2012 RUNWAY</a></li>
					<li><a href="#">SS 2012 COLLECTION</a></li>
					<li><a href="#">FW 2011 FASHION SHOW</a></li>
					<li><a href="#">FW 2011 RUNWAY</a></li>
					<li><a href="#">FW 2011 COLLECTION</a></li>
				</ul>	
			</li>	
		</ul>'
  end
  
end
