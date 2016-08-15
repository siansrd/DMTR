require('pg')
require_relative('../db/sql_runner')

class Business

  attr_reader :name, :id

  def initialize(options)
    @id   = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO businesses (name) 
          VALUES ('#{@name}')
          RETURNING *;"
    business = SqlRunner.run( sql ).first
    @id = business['id']
  end

  def self.destroy(id)
    sql = "DELETE FROM businesses WHERE id = #{id};"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM businesses"
    return Business.map_businesses( sql )
  end


  def self.map_businesses( sql )
    businesses = SqlRunner.run(sql)
    businesses_objs = businesses.map { |business| Business.new(business) }
    return businesses_objs
  end


end