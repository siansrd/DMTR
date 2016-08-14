require('pg')

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

  def save()
    sql = "INSERT INTO transactions
          (day, amount, supplier, business_id, category_id) VALUES 
          ('#{day}', '#{amount}', '#{supplier}', '#{business_id}', '#{category_id}')
          RETURNING *;"
    transaction = SqlRunner.run( sql ).first
    @id = transaction['id']
  end

  def self.destroy(id)
    sql = "DELETE FROM transactions WHERE id = #{id};"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM transactions"
    return Transaction.map_trans(sql)
  end

  def self.map_trans(sql)
    transactions = SqlRunner.run(sql)
    return transactions.map{ |transaction| 
      Transaction.new(transaction)
    }
  end


end