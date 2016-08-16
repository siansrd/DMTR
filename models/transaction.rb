require('pg')
require ('csv')
require_relative('./category')
require( 'pry-byebug' )

class Transaction

attr_reader :id, :day, :amount, :supplier, :business_id, :category_id

  def initialize(options)
    @id             = options['id'].to_i
    @day            = options['day']
    @amount         = options['amount'].to_f
    @supplier       = options['supplier']
    @business_id    = options['business_id'].to_i
    @category_id    = options['category_id'].to_i
  end

  def price 
    return "%.2f" % @amount 
  end

  def save()
    sql = "INSERT INTO transactions
          (day, amount, supplier, business_id, category_id) VALUES 
          ('#{day}', '#{amount}', '#{supplier}', '#{business_id}', '#{category_id}')
          RETURNING *;"
    transaction = SqlRunner.run( sql ).first
    @id = transaction['id']
  end

  # def category
  #   sql = "SELECT * FROM categories WHERE id = #{@category_id};"
  #   category_hash = SqlRunner.run( sql ).first
  #   return category_hash
  # end


  def category
    sql = "SELECT categories.* FROM categories
          INNER JOIN transactions
          ON categories.id = transactions.category_id
          WHERE transactions.id = #{@id};"
    category_hash = SqlRunner.run( sql ).first
    return category_hash
  end


  def business
    sql = "SELECT businesses.* FROM businesses
          INNER JOIN transactions
          ON businesses.id = transactions.business_id
          WHERE transactions.id = #{@id};"
    business_hash = SqlRunner.run( sql ).first
    return business_hash
  end

  def self.destroy(id)
    sql = "DELETE FROM transactions WHERE id = #{id};"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM transactions"
    unsorted = Transaction.map_trans(sql)
    # unsorted is an array of objects
    sorted = unsorted.sort_by { |transaction| transaction.day }
    return sorted
  end

  def self.map_trans(sql)
    transactions = SqlRunner.run(sql)
    return transactions.map{ |transaction| 
      Transaction.new(transaction)
    }
  end

  # Export database into a csv file
  # def self.csv
  #   CSV.generate do |csv|
  #     csv << ["ID","DATE","AMOUNT", "SUPPLIER", "BUSINESS ID", "CATEGORY ID"]
  #     sql = "SELECT * FROM transactions;"
  #     transactions_hashes = SqlRunner.run(sql)
  #     transactions_hashes.each { |row| csv << row }
  #   end
  # end

end




