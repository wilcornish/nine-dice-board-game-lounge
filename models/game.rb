class Game

  attr_reader( :id, :name, :owner, :times_played,  :genre, :player_count, :play_time )

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @owner = options['owner']
    @times_played = 0
    @genre = options['genre']
    @player_count = options['player_count'].to_i
    @play_time = options['play_time'].to_i
  end

end
