require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/game.rb' )
require_relative( '../models/genre.rb' )
require_relative( '../models/play_time.rb' )
require_relative( '../models/player_count.rb' )
also_reload( '../models/*' )
require('pry-byebug')
#index
get '/games' do
  @games = Game.all()
  erb ( :'games/index' )
end

#new
get '/games/new' do
  @genres = Genre.all()
  @play_times = PlayTime.all()
  @player_counts = PlayerCount.all()
  erb( :'games/new' )
end

#edit
get '/games/:id/edit' do
  @genres = Genre.all()
  @play_times = PlayTime.all()
  @game = Game.find(params['id'].to_i)
  @player_counts = PlayerCount.all()
  erb ( :'games/edit' )
end

#show
get '/games/:id' do
  @game = Game.find(params['id'].to_i)
  erb ( :'games/show' )
end

#create
post '/games' do
  game = Game.new(params)
  game.save
  redirect to ('/games')
end

#update
post '/games/:id' do
  @game = Game.new(params)
  @game.update()
  # binding.pry
  redirect to ("/games/#{params[:id]}")
end
