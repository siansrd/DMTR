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


end