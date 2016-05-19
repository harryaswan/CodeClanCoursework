require("sinatra")
require("sinatra/contrib/all") if development?
require("json")
require("pry-byebug")
require_relative("db/sql_runner")
require_relative('models/artist')
require_relative('models/album')

require_relative('controllers/album_controller')
require_relative('controllers/artist_controller')

get '/' do
    erb(:home)
end

get '/library' do
    @artists = Artist.all()
    erb(:library)
end
