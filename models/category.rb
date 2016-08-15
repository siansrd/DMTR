require('pg')
require_relative('../db/sql_runner')

class Category

  attr_reader :label, :id

  def initialize(options)
    @id   = options['id'].to_i
    @label = options['label']
  end

  def save()
    sql = "INSERT INTO categories (label)
          VALUES ('#{@label}')
          RETURNING *;"
    category = SqlRunner.run( sql ).first
    @id = category['id']
  end

  def self.all()
    sql = "SELECT * FROM categories"
    return Category.map_cats(sql)
  end

  def self.map_cats(sql)
    categories = SqlRunner.run( sql )
    cat_objs = categories.map { |category| Category.new(category) }
    return cat_objs
  end

  def transactions()
    sql = "SELECT * FROM transactions
          WHERE category_id = #{id}"
    transactions = SqlRunner.run( sql )
    transactions.map { |transaction| Transaction.new(transaction) }
  end



end