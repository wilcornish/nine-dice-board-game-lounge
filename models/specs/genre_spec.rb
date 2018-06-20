require('minitest/autorun')
require('pry-byebug')

require_relative('../genre.rb')
require_relative('../game.rb')

class GenreTest < MiniTest::Test

  def setup

    @genre1 = Genre.new({
      'genre' => 'co-operative'
      })
  end

  def test_genre_has_genre
    assert_equal('co-operative', @genre1.genre)
  end

end
