require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/game.rb' )
also_reload( '../models/*' )

#show
get '/games' do
  @games = Game.all()
  erb ( :'games/index' )
end

#index
get '/games/:id' do
  @games = Game.find(params['id'].to_i)
  erb ( :'games/show' )
end

#new
get '/games/new' do
  erb( :'games/new' )
end

#edit
get 'games/:id/edit' do
  @game = Game.find(params[:id])
  erb (:'game/edit')
end

#create
post '/games' do
  game = Game.new(params)
  game.save
  redirect to ('/games')
end

#update
put '/games/:id' do
  game = Game.find(params['id'].to_i)
  game.update(params)
  redirect to ('/games/:id')
end
