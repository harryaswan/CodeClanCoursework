require("sinatra")
require("sinatra/contrib/all") if development?
require("json")
require("pry-byebug")
require_relative("./models/calculator")

get '/' do
    erb(:home)
end

get '/about' do
    erb(:about)
end

get '/add/:num1/:num2' do
    # return Calculator.new(params[:num1].to_i(), params[:num2].to_i()).add().to_s()
    @calculation = Calculator.add(params[:num1].to_i(), params[:num2].to_i()).to_s()
    erb(:result)
end

get '/subtract/:num1/:num2' do
    return Calculator.sub(params[:num1].to_i(), params[:num2].to_i()).to_s()
end

get '/multi/:num1/:num2' do
    return Calculator.multi(params[:num1].to_i(), params[:num2].to_i()).to_s()
end


get '/divide/:num1/:num2' do
    return Calculator.divide(params[:num1].to_f(), params[:num2].to_f()).to_s()
end

get '/all/:num1/:num2' do
    content_type(:json)
    calc = Calculator.new(params[:num1].to_i(), params[:num2].to_i())
    results = {
        add: calc.add(),
        subtract: calc.sub(),
        divide: calc.divide(),
        multiply: calc.multi()
    }
    return results.to_json()
end
