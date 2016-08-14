require_relative('../models/transaction')
require_relative('../models/business')
require_relative('../models/category')
require('pry-byebug')

get ('/transactions') do
  @transactions = Transaction.all
  erb(:'transactions/index')
end

get ('/transactions/new') do
  @categories = Category.all
  @businesses = Business.all
  erb(:'transactions/new')
end

post ('/transactions') do
  transaction = Transaction.new(params)
  transaction.save()
  redirect(to('/transactions'))
end

