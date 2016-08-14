require_relative('../models/category')

get ('/categories') do
  @categories = Category.all
  erb (:'categories/index')
end