require('minitest/autorun')
require('pry-byebug')

require_relative('../loan.rb')

class LoanTest < MiniTest::Test

  def setup
    @loan1 = Loan.new({
      'customer_id' => 1,
      'game_id' => 1,
      'day_borrowed' => "Satuday"
      })
  end

  def test_has_game_id
    assert_equal(1, @loan1.game_id)
  end

  def test_has_customer_id
    assert_equal(1, @loan1.customer_id)
  end

end
