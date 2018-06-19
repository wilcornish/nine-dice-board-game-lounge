require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/game.rb' )
also_reload( '../models/*' )

get '/games' do
  @games = Game.all()
  erb ( :game/index )
end

get '/games/:id' do
  @games = Game.find(params['id'].to_i)
  erb ( :game/show )
end

get '/games/new' do
  erb( :games/new )
end

get 'games/:id/edit' do
  @game = Game.find(params[:id])
  erb (:edit)
end

post '/games' do
  game = Game.new(params)
  game.save
  redirect to ('/games')
end

put '/games/:id' do
  game = Game.find(params['id'].to_i)
  game.update(params)
  redirect to ('/games/:id')
end
