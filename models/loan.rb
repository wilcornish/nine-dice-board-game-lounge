require_relative('../db/sql_runner.rb')
require_relative('./customer.rb')
require_relative('./game.rb')

class Loan

  attr_reader( :id, :game_id, :customer_id, :returned, :day_borrowed)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @game_id = options['game_id']
    @returned = options['returned']||false
    @day_borrowed = options['day_borrowed']
  end

  def return_game
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

  date = Date.new()

  def update()
    sql = "UPDATE loans
      SET (customer_id, game_id, returned, day_borrowed)
      = ($1, $2, $3, $4)
      WHERE ID = $5"
    values = [@customer_id, @game_id, @returned, @day_borrowed, @id]
    SqlRunner.run()
  end

  def self.all()
    sql = "SELECT * FROM loans"
    results = SqlRunner.run( sql )
    return results.map {|loan| Loan.new( loan )}
  end

  def self.find(id)
    sql = "SELECT * FROM loans WHERE ID = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Loan.new(results.first)
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

  def self.check_out(customer, game)
    new_loan = nil
    if customer.existing_loans?() && game.avaliable?()
      day = Time.now.strftime("%A")
      new_loan = Loan.new({
        'customer_id' => customer.id(),
        'game_id' => game.id(),
        'day_borrowed' => "#{day}"
        })
      new_loan.save
    end
    return new_loan
  end

  def self.check_in(game)
    game.increment()
    game.update()
    sql = "SELECT * FROM loans WHERE (game_id = $1 AND returned = false)"
    values = [game.id()]
    loan = SqlRunner.run(sql, values).first
    to_return = Loan.new( loan )
    sql = "UPDATE loans
          SET returned = true
          WHERE id = $1;"
    values = [to_return.id().to_i]
    SqlRunner.run(sql, values)
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
