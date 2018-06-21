require('minitest/autorun')
require('pry-byebug')

require_relative('../play_time.rb')

class PlayTimeTest < MiniTest::Test

  def setup

    @play_time1 = PlayTime.new({
      'play_time' => '20'
      })
  end

  def test_play_time_has_play_time
    assert_equal('20', @play_time1.play_time)
  end

end
