require_relative('../db/sql_runner.rb')

class Game

  attr_reader( :id, :name, :owner, :times_played,  :genre, :player_count, :play_time )

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @owner = options['owner']
    @times_played = 0
    @genre = options['genre']
    @player_count = options['player_count'].to_i
    @play_time = options['play_time'].to_i
  end

  def increment
    @times_played += 1
  end

  def save()
    sql = "INSERT INTO games
    (
      name,
      owner,
      times_played,
      genre,
      player_count,
      play_time
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @owner, @times_played, @genre, @player_count, @play_time]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN loans ON loans.customer_id = customers.id WHERE loans.game_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |customer| Customer.new(customer) }
  end

  def avaliable?()
    sql = 'SELECT * FROM loans WHERE (loans.game_id = $1 AND loans.returned = false)'
    values = [@id]
    results = SqlRunner.run(sql, values)
    results.count == 0
  end

  def self.all()
    sql = "SELECT * FROM games"
    results = SqlRunner.run( sql )
    return results.map {|game| Game.new( game)}
  end

  def self.find( id )
    sql = "SELECT * FROM games
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Game.new(results.first)
  end

  def self.delete_all
    sql = "DELETE FROM games"
    SqlRunner.run(sql)
  end

  def self.delete( id )
    sql = "DELETE FROM games WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
