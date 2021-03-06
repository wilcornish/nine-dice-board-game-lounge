require('minitest/autorun')
require('pry-byebug')

require_relative('../game.rb')

class GameTest < MiniTest::Test

  def setup
    @game1 = Game.new({
      'name' => 'Mysterium',
      'owner' => 'Wil',
      'genre' => 'co-operative',
      'player_count' => 5,
      'play_time' => 45
      })
  end

  def test_game_has_name
    assert_equal('Mysterium', @game1.name)
  end

  def test_game_has_owner
    assert_equal('Wil', @game1.owner)
  end

  def test_game_has_times_played
    assert_equal(0,@game1.times_played)
  end

  def test_increment_plays
    @game1.increment()
    assert_equal(1, @game1.times_played)
  end

  # def test_game_is_avaliable__true
  #   assert_equal(true, #game1 in DB .check_avaliable())
  # end
  #
  # def test_game_is_avaliable__false
  #   assert_equal(true, #game2 in DB .check_avaliable())
  end

end
