require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb' )
also_reload( '../models/*' )

#show
get '/customers' do
  @customers = Customer.all()
  erb ( :customer/index )
end

#index
get '/customers/:id' do
  @customers = Customer.find(params['id'].to_i)
  erb ( :customer/show )
end

#new
get '/customers/new' do
  erb( :customers/new )
end

#edit
get 'customers/:id/edit' do
  @customer = Customer.find(params[:id])
  erb (:edit)
end

#create
post '/customers' do
  customer = Customer.new(params)
  customer.save
  redirect to ('/customers')
end

#update
put '/customers/:id' do
  customer = Customer.find(params['id'].to_i)
  customer.update(params)
  redirect to ('/customers/:id')
end
