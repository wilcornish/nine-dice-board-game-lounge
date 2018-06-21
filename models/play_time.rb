require_relative('../db/sql_runner.rb')

class PlayTime

  attr_reader( :id, :play_time)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @play_time = options['play_time']
  end

  def save()
    sql = "INSERT INTO play_times (play_time) VALUES ($1) RETURNING id"
    values = [@play_time]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM play_times"
    results = SqlRunner.run( sql )
    return results.map {|play_time| PlayTime.new(play_time)}
  end

  def self.find(id)
    sql = "SELECT * FROM play_times
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return PlayTime.new(results.first)
  end

  def self.delete_all
    sql = "DELETE FROM play_times"
    SqlRunner.run(sql)
  end

end
