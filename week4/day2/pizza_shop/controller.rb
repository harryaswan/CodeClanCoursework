require("sinatra")
require("sinatra/contrib/all") if development?
require("json")
require("pry-byebug")
require_relative("db/sql_runner")
require_relative('models/pizza')

# ***** GETS *****

get '/' do
    erb(:index)
end

get '/pizzas/new' do
    # NEW
    erb(:new)
end

get '/pizzas' do
    # INDEX
    @pizzas = Pizza.all()
    erb(:pizzas)
end

get '/pizzas/:id' do
    # SHOW
    @pizza = Pizza.find(params[:id])

end

get '/pizzas/:id/edit' do
    # EDIT

end


put '/pizzas/:id' do
    # UPDATE

end

delete '/pizzas/:id' do
    # DELETE

end

# ***** POST *****

post "/pizzas" do
    # CREATE
    @pizza = Pizza.new(params)
    @pizza.save()
    erb(:create)
end
