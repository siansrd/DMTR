require_relative('../models/transaction')
require_relative('../models/business')
require_relative('../models/category')
require_relative('../models/analysis')
require('csv')
require('pry-byebug')

# Main transactions page.
get ('/transactions') do
  @businesses = Business.all
  @categories = Category.all
  @analysis = Analysis.new
  @transactions = Transaction.all

  if params[:category_id]
    @transactions = @analysis.filter_trans_by_category(params[:category_id])
  end
  
  if params[:business_id]
    @transactions = @analysis.filter_trans_by_business(params[:business_id])
  end

  erb(:'transactions/index')
end

# New transactions form
get ('/transactions/new') do
  @categories = Category.all
  @businesses = Business.all
  erb(:'transactions/new')
end

# Submit new transaction
post ('/transactions') do
  transaction = Transaction.new(params)
  transaction.save()
  redirect(to('/transactions'))
end

# Delete a transaction
post ('/transactions/:id/delete') do
  Transaction.destroy( params[:id] )
  redirect( to('/transactions'))
end

# NOT NEEDED
# This comes from the analysis model
# get ('/transactions/:category_id') do
#   @transaction = Transaction.all
#   erb(:'transactions/category')
# end

# CSV file download
get ('/transactions/download') do
  @analysis = Analysis.new
  content_type 'application/csv'
  attachment "dmtr.csv"
  file = @analysis.create_csv()
end

# Graph page
get ('/transactions/graph') do
  erb (:'transactions/graph')
end

