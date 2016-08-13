require_relative('../models/business')
require('pry-byebug')


get ('/businesses') do
  @businesses = Business.all 
  erb(:'businesses/index')
end



get ('/businesses/new') do
  erb(:'businesses/new')
end

post ('/businesses') do
 business = Business.new(params)
 business.save
 redirect (to('/businesses'))
end