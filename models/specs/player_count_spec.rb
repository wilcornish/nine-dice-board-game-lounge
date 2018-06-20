require('minitest/autorun')
require('pry-byebug')

require_relative('../player_count.rb')

class PlayerCountTest < MiniTest::Test

  def setup

    @player_count1 = PlayerCount.new({
      'player_count' => '5'
      })
  end

  def test_player_count_has_player_count
    assert_equal('5', @player_count1.player_count)
  end

end
