require 'faker'

namespace :db do 

  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke 
    
    # create the users
    User.create!(:username => "Example User",
      :email => "user@example.com",
      :password => "user1234")
   
    # create sample collections   
    Collection.create!(:collection => "Test Collection 1")
    Collection.create!(:collection => "2 Test Collection")
    Collection.create!(:collection => "3rd Test Collection")    
    
    # create sample sizes
    Size.create!(:size_code => "0 to 16", :size_description => "Missy 0 to 16")
    
    # create sample colors
    Color.create!(:color_code => "BLACK", :color_name => "BLACK")
    Color.create!(:color_code => "WHITE", :color_name => "WHITE")
    Color.create!(:color_code => "RED", :color_name => "RED")
    
    #create 100 styles
    100.times do |n|
      name = "#{n+1}"
      description = Faker::Lorem.words
      price = 99.99
      Style.create!(:name => name,
                    :collection_id => 1,
                    :color_id => 1,
                    :size_id => 1,
                    :description => description,
                    :price => price)
    end
                    
  end 

end
