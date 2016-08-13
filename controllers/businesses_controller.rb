require_relative('../models/business')

get ('/new') do
  erb(:'businesses/new')
end

post ('/index') do
 business = Business.new(params)
 business.save
 redirect to( '/index' )
end