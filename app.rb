require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../controllers/customer_controller.rb')
require_relative('../controllers/game_controller.rb')
require_relative('../controllers/loan_controller.rb')

get '/' do
  erb( :index )
end
