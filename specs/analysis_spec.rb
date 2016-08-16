require('minitest/autorun')
require('minitest/rg')
require_relative('../models/analysis')
require_relative('../models/category')
require_relative('../models/business')

class TestAnalysis < Minitest::Test

  def setup
    @analysis = Analysis.new()
  end


  def test_businesses_names
    assert_equal(['Web Design', 'Teaching'], @analysis.businesses_names)
  end

  def test_businesses_count
    assert_equal(2, @analysis.business_count)
  end

  def test_total_transactions
    assert_equal(260.65, @analysis.total_transactions)
  end

  
  # def test_transactions_selection(transactions_array)

  # end


end