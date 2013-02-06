# By using the symbol ':user', we get Factory Girl to simulate the user model 
Factory.define :user do |user|
  user.username                 "Ruben"
  user.email                    "ruben@tadashishoji.com"
  user.password                 "foobar"
  user.password_confirmation    "foobar"
end

Factory.define :collection do |collection|
  collection.collection         "Tadashi Shoji Fall 2012"
end


Factory.define :size do |size|
  size.size_code              "0 to 16"
  size.size_description       "Missy 0 to 16"
end

Factory.define :color do |color|
  color.color_code            "BLACK"
  color.color_name            "BLACK COLOR"
end

Factory.define :style do |style|
  style.name            "BLACK"
  style.price           388
  style.description     "chiffon beaded gown"
  style.collection_id   1
  style.color_id        1
  style.size_id         1
  style.position        1
end

Factory.define :product_image do |product_image|
  product_image.image_filename      "blank.png"
  product_image.image_type          1
  product_image.label               "base"  
  product_image.style_id            1
end  

Factory.define :country do |country|
  country.id                    1
  country.country_name          "United States"
  country.international         false
end  

Factory.define :state do |state|
  state.country_id    1
  state.id            1
  state.state_code    "CA"
  state.state         "California"
end

Factory.define :retailer do |retailer|
  retailer.store        "Tadashi Shoji"
  retailer.address1     "3016 E 44th St"
  retailer.address2     ""
  retailer.city         "Vernon"
  retailer.state_id     1
  retailer.zip_code     "90058"
  retailer.country_id   1  
end
  
