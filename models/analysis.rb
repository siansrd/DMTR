require_relative('./business')
require_relative('./category')
require_relative('./transaction')
require('pry-byebug')



class Analysis

  attr_reader :categories, :businesses, :transactions

  def initialize(options)
    @categories     = options['categories']
    @businesses     = options['businesses']
    @transactions   = options['transactions']
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

  def total_transactions()
    total = 0
    @transactions.each do |business| 
      total += business.amount
    end
    string = "%.2f" % total
    return total_f = string.to_f
  end

  


end