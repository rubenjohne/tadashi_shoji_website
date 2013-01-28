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