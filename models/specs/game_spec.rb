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
end
