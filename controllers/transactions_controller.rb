require_relative('../models/transaction')
require_relative('../models/business')
require_relative('../models/category')
require_relative('../models/analysis')
require('pry-byebug')

get ('/transactions') do
  @categories = Category.all
  @analysis = Analysis.new
  @transactions = Transaction.all
  if params[:category_id]
    #filter our transactions to only those of the category id
    @transactions = @transactions.select do |transaction|
      transaction.category_id == params[:category_id].to_i
    end
  end
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

post ('/transactions/:id/delete') do
  Transaction.destroy( params[:id] )
  redirect( to('/transactions'))
end

# This comes from the analysis model
get ('/transactions/:category_id') do
  @transaction = Transaction.all
  erb(:'transactions/category')
end

