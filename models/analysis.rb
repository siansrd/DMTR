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
    return "%.2f" % total
  end
  
  # Use the CSV gem to generate and populate a CSV fil
  def create_csv()
    hashes = Transaction.all_as_hashes
    CSV.generate do |csv|
      # Adds the keys as headings on the first line
      csv << hashes.first.keys
      # Iterates through the transactions and populates CSV
      hashes.each do |hash|
        csv << hash.values
      end
    end
  end

  def filter_trans_by_category(cat_id)
      @transactions = @transactions.select do |transaction|
        transaction.category_id == cat_id.to_i
      end
  end

  def filter_trans_by_business(bus_id)
      @transactions = @transactions.select do |transaction|
        transaction.business_id == bus_id.to_i
      end
  end

end







