# By using the symbol ':user', we get Factory Girl to simulate the user model 
Factory.define :user do |user|
  user.username                 "Ruben"
  user.email                    "ruben@tadashishoji.com"
  user.password                 "foobar"
  user.password_confirmation    "foobar"
end