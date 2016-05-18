require("sinatra")
require("sinatra/contrib/all") if development?
require("json")
require("pry-byebug")
require_relative("db/sql_runner")
require_relative('models/pizza')

# ***** GETS *****

get '/' do
    erb(:home)
end

get '/pizzas/new' do
    # NEW
    erb(:new)
end

get '/pizzas' do
    # INDEX
    @pizzas = Pizza.all()
    erb(:index)
end

get '/pizzas/:id' do
    # SHOW
    @pizza = Pizza.find(params[:id])
    erb(:show)
end

get '/pizzas/:id/edit' do
    # EDIT
    @pizza = Pizza.find(params[:id])
    erb(:edit)
end


put '/pizzas/:id' do
    # UPDATE
    @pizza = Pizza.update(params)
    redirect '/pizzas/' + params[:id]
end

delete '/pizzas/:id' do
    # DELETE
    if params[:delete]
        @pizza = Pizza.delete(params[:id])
    end

    redirect '/pizzas'
end

# ***** POST *****

post "/pizzas" do
    # CREATE
    pizza = Pizza.new(params)
    @pizza = pizza.save()
    erb(:create)
end
