require_relative('./business')
require_relative('./category')
require_relative('./transaction')
require('pry-byebug')
require('csv')



class Analysis

  attr_reader :categories, :businesses, :transactions

  def initialize()
    @categories     = Category.all
    @businesses     = Business.all
    @transactions   = Transaction.all
  end

  def businesses_names()
    business_names = []
    @businesses.each do |business|
      business_names << business.name
    end
    return business_names
  end

  def business_count()
    @businesses.count
  end

# Total all transaction amounts
  def total_transactions(transactions_array)
    total = 0
    transactions_array.each do |transaction| 
      total += transaction.amount
    end
    string = "%.2f" % total
    return total_f = string.to_f
  end




  def create_csv()
    hashes = Transaction.all_as_hashes
    CSV.generate do |csv|
      csv << hashes.first.keys # adds the attributes name on the first line
      hashes.each do |hash|
        csv << hash.values
      end
    end
  end



end







