require_relative('../models/business')


get ('/businesses') do
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