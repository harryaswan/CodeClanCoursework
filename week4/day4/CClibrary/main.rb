require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require_relative('models/book')
require_relative('models/member')
require_relative('models/rental')
require_relative('controllers/books_controller')
require_relative('controllers/members_controller')
require_relative('controllers/rentals_controller')

get '/' do
  erb :home
end
