require_relative('../db/sql_runner.rb')

class Loan

  attr_reader( :id, :game_id, :customer_id, :returned, :day_borrowed)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @game_id = options['game_id']
    @returned = false
    @day_borrowed = options['day_borrowed']
  end

  def return
    @returned = true
  end

  def save()
    sql = "INSERT INTO loans
    (
      customer_id,
      game_id,
      returned,
      day_borrowed
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@customer_id, @game_id, @returned, @day_borrowed]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM loans"
    results = SqlRunner.run( sql )
    return results.map {|loan| Loan.new( loan )}
  end

  def game()
    sql = "SELECT * FROM games
    WHERE id = $1"
    values = [@game_id]
    results = SqlRunner.run(sql, values)
    return Game.new(results.first)
  end

  def customer()
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [@customer_id]
    results = SqlRunner.run(sql, values)
    return Customer.new(results.first)
  end

  def self.delete_all()
    sql = "DELETE FROM loans"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM loans
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end


end
