require_relative('./models/album')
require_relative('./models/artist')
require('pry-byebug')

artist1 = Artist.new({'name' => 'Elbow'}).save()
album1 = Album.new({'name' => 'Seldom Seen Kid', 'artist_id' => artist1.id}).save()


binding.pry
nil


# def run()
#     while @running
#         inp = gets.chomp
#         do_something(inp)
#     end
# end
#
# def method_name
#
# end
