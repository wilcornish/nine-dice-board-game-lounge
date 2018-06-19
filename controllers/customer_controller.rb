require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb' )
also_reload( '../models/*' )

#index
get '/customers' do
  @customers = Customer.all()
  erb ( :'customers/index' )
end

#new
get '/customers/new' do
  erb( :'customers/new' )
end

#edit
get '/customers/:id/edit' do
  @customer = Customer.find(params['id'].to_i)
  erb ( :'customers/edit' )
end

#show
get '/customers/:id' do
  @customer = Customer.find(params['id'].to_i)
  erb ( :'customers/show' )
end

#create
post '/customers' do
  customer = Customer.new(params)
  customer.save
  redirect to ('/customers')
end

#update
put '/customers/:id' do
  @customer = Customer.new(params)
  @customer.update()
  redirect to ('/customers/:id')
end
