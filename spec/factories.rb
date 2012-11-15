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