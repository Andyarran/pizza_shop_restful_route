require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza.rb')

#INDEX
get '/pizzas' do
  @pizzas = Pizza.all
  erb(:index)
end

#NEW
get '/pizzas/new' do
 erb(:new)
end

#SHOW
get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb(:show)
end

#CREATE
post '/pizzas' do
  @pizza = Pizza.new(params)
  @pizza.save
  redirect '/pizzas'
end

#EDIT
get '/pizzas/:id/edit' do
  @id = params[:id]
  erb(:pizza_edit)
end

#UPDATE
post '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  @pizza.update
  redirect '/pizzas'
end

#DESTROY

get  '/pizzas/:id/destroy' do
  @pizza = Pizza.find(params[:id])
  @pizza.delete
  redirect '/pizzas'
  end

# get  '/pizzas/:id/destroy' do
#     @id = params[:id]
#     erb(:destroy)
#   end

# post  '/pizzas/:id/destroy' do
#   @pizza = Pizza.find(params[:id])
#   @pizza.delete
#   redirect '/pizzas'
# end

