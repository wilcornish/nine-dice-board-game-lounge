require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb' )
require_relative( '../models/game.rb' )
require_relative( '../models/loan.rb' )
also_reload( '../models/*' )

#show
get '/loans' do
  @customers = Customer.all()
  @games = Game.all()
  erb ( :'loans/index' )
end

#index
get '/loans/:id' do
  @loans = Loan.find(params['id'].to_i)
  erb ( :'loans/show' )
end

#new
get '/games/new' do
  @games = Game.all()
  @customers = Customer.all()
  erb( :'loans/new' )
end

#create
post '/games' do
  loan = Loan.new(params)
  loan.save
  redirect to ('/loans')
end
