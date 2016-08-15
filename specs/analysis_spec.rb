require('minitest/autorun')
require('minitest/rg')
require_relative('../models/analysis')
require_relative('../models/category')
require_relative('../models/business')

class TestAnalysis < Minitest::Test

  def setup
    @test_categories_array   = Category.all
    @test_businesses_array   = Business.all
    @test_transactions_array = Transaction.all

    test_analysis_data = { 
      'categories'    => @test_categories_array, 
      'businesses'    => @test_businesses_array, 
      'transactions'  => @test_transactions_array 
    }

    @analysis = Analysis.new(test_analysis_data)
  end


  def test_businesses_names
    assert_equal(['Web Design', 'Teaching'], @analysis.businesses_names)
  end

  # def test_transactions
  #   assert_equal('All the transactions', @analysis.transactions)
  # end

  def test_businesses_count
    assert_equal(2, @analysis.business_count)
  end

  # def test_total_transactions
  #   assert_equal(260.65, @analysis.total_transactions)
  # end

  # def test_total_one_category

  # end


end