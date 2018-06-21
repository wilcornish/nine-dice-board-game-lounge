require_relative('../db/sql_runner.rb')

class PlayerCount

  attr_reader( :id, :player_count)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @player_count = options['player_count']
  end

  def save()
    sql = "INSERT INTO player_counts (player_count) VALUES ($1) RETURNING id"
    values = [@player_count]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM player_counts"
    results = SqlRunner.run( sql )
    return results.map {|player_count| PlayerCount.new(player_count)}
  end

  def self.find(id)
    sql = "SELECT * FROM player_counts
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return PlayerCount.new(results.first)
  end

  def self.delete_all
    sql = "DELETE FROM player_counts"
    SqlRunner.run(sql)
  end

end
