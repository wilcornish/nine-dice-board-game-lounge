require('minitest/autorun')
require('pry-byebug')

require_relative('../customer.rb')

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new({
      'badge_number' => 0451,
      'name' => 'Dave Cornelius'
      })
  end

  def test_customer_has_badge_number
    assert_equal(0451, @customer1.badge_number())
  end

  def test_customer_has_name
    assert_equal('Dave Cornelius', @customer1.name())
  end

end
