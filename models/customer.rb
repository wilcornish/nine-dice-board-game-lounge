require_relative('../db/sql_runner.rb')

class Customer

  attr_reader( :id, :badge_number, :name)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @badge_number = options['badge_number'].to_i
    @name = options['name']
  end

  def save()
  sql = "INSERT INTO customers
  (
    name,
    type
  )
  VALUES
  (
    $1, $2
  )
  RETURNING id"
  values = [@name, @badge_number]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end

def games
  sql = "SELECT games.* FROM games INNER JOIN loans ON loans.game_id = games.id WHERE loans.customer_id = $1;"
  values = [@id]
  results = SqlRunner.run(sql, values)
  return results.map { |game| Game.new(game) }
end

def self.all()
  sql = "SELECT * FROM customers"
  results = SqlRunner.run( sql )
  return results.map { |hash| Customer.new( hash ) }
end

def self.find( id )
  sql = "SELECT * FROM customers
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run( sql, values )
  return Customer.new( results.first )
end

def self.delete_all
  sql = "DELETE FROM customers"
  SqlRunner.run( sql )
end

end
