require('pg')
require('../db/sql_runner')

class Business

  attr_reader :name

  def initilize(id, name)
    @id = id.to_i
    @name = name
  end

  def save()
    sql = "INSERT INTO businesses (name) 
    VALUES '#{@name}'
    RETURNING *;"
    business = SqlRunner.run( sql ).first
    @id = business['id']
  end


end