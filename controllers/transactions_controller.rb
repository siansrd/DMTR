require_relative('../models/transaction')
require_relative('../models/business')
require_relative('../models/category')
require_relative('../models/analysis')
require('pry-byebug')


get ('/transactions') do
  @businesses = Business.all
  @categories = Category.all
  @analysis = Analysis.new
  @transactions = Transaction.all
  if params[:category_id]
    #filter @transactions to only those with a category id
    @transactions = @transactions.select do |transaction|
      transaction.category_id == params[:category_id].to_i
    end
  end
  if params[:business_id]
    # filter @transactions to only those with a business id
    @transactions = @transactions.select do |transaction|
      transaction.business_id == params[:business_id].to_i
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
# get ('/transactions/:category_id') do
#   @transaction = Transaction.all
#   erb(:'transactions/category')
# end

# CSV file download
get ('/transactions/download') do
  data = Transaction.all_not_mapped
  binding.pry
  nil

      # content_type 'application/csv'
      # attachment "myfilename.csv"
      # data.each{|k, v|
      #    p v
      # }


#   erb(:transactions)
end


