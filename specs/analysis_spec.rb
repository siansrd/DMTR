require('minitest/autorun')
require('minitest/rg')
require_relative('../models/analysis')
require_relative('../models/category')
require_relative('../models/business')
require_relative('../models/transaction')

class TestAnalysis < Minitest::Test

  def setup
    @analysis = Analysis.new()
    @transactions = Transaction.all()
  end


  # def test_businesses_names
  #   assert_equal(["Business", "Web Development", "Teaching"], @analysis.businesses_names)
  # end

  # def test_businesses_count
  #   assert_equal(3, @analysis.business_count)
  # end

  def test_total_transactions
    assert_equal(284.66, @analysis.total_transactions(@transactions))
  end

  


end