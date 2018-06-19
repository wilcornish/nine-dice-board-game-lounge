require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb' )
require_relative( '../models/game.rb' )
require_relative( '../models/loan.rb' )
also_reload( '../models/*' )

#index
get '/loans' do
  @loans = Loan.all()
  erb ( :'loans/index' )
end

#new
get '/loans/new' do
  @games = Game.all()
  @customers = Customer.all()
  erb( :'loans/new' )
end

#show
get '/loans/:id' do
  @loan = Loan.find(params['id'].to_i)
  erb ( :'loans/show' )
end

#create
post '/loans' do
  game = Game.find("#{params['game_id']}")
  customer = Customer.find("#{params['customer_id']}")
  Loan.check_out(customer, game)
  redirect to ('/loans')
end
