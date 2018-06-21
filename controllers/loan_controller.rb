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

get '/loans/no_stock/:id' do
  @games = Game.all()
  @customers = Customer.all()
  @game = Game.find(params['id'].to_i)
  erb (:'loans/no_stock')
end

#create
post '/loans' do
  game = Game.find(params['game_id'])
  customer = Customer.find(params['customer_id'])
  if !customer.existing_loans?()
    @loans = Loan.all()
    erb ( :'loans/already_exists')
  elsif !game.avaliable?()

    redirect to "/loans/no_stock/#{params['game_id']}"
  else
    Loan.check_out(customer, game)
    redirect to ('/loans')
  end
end

post '/loans/:id/check-in' do
  game = Loan.find(params['id'].to_i).game()
  Loan.check_in(game)
  redirect to ('/loans')
end
