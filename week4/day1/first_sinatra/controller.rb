require('sinatra')
require('sinatra/contrib/all') if development?

# get '/' do
#     "Hello World!!!"
# end

get '/hi' do
    return "hello"
end

get '/name' do
    return "Harry A. Swan"
end

get '/address' do
    return "7 Larch Place, Errol, Perth"
end

get '/fav-book' do
    return "Ready Player One"
end

get '/name/:title/:f_name/:s_name' do
    puts params
    string = ""
    for a in params.keys
        string << "#{params[a]} </br>"
    end
    # return string
    return "Hello #{params[:title].capitalize} #{params[:f_name].capitalize} #{params[:s_name].capitalize}"
end
