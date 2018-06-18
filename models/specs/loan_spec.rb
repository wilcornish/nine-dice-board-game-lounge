require('minitest/autorun')
require('pry-byebug')

require_relative('../loan.rb')
require_relative('../game.rb')

class LoanTest < MiniTest::Test

  def setup
    @loan1 = Loan.new({
      'customer_id' => 1,
      'game_id' => 1,
      'day_borrowed' => "Saturday"
      })

    @game1 = Game.new({
      'name' => 'Mysterium',
      'owner' => 'Wil',
      'genre' => 'co-operative',
      'player_count' => 5,
      'play_time' => 45
      })
  end

  def test_has_game_id
    assert_equal(1, @loan1.game_id())
  end

  def test_has_customer_id
    assert_equal(1, @loan1.customer_id())
  end

  def test_is_returned__false
    assert_equal(false, @loan1.returned())
  end

  def test_has_day_borrowed
    assert_equal('Saturday', @loan1.day_borrowed())
  end

  def test_change_returned__true
    @loan1.return
    assert_equal(true, @loan1.returned)
  end

  # def test_check_in
  #   @loan1.check_in
  #   assert_equal(true, @loan1.returned)
  #   assert_equal(1, @game1.times_played)
  # end

end
