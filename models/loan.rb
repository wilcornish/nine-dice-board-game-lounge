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

end
