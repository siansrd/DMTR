require('pg')
require_relative('../db/sql_runner')

class Business

  attr_reader :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO businesses (name) 
    VALUES ('#{@name}')
    RETURNING *;"
    business = SqlRunner.run( sql ).first
    @id = business['id']
  end


end