require_relative('./models/album')
require_relative('./models/artist')
require('pry-byebug')

# artist1 = Artist.new({'name' => 'Elbow'}).save()
# Album.new({'name' => 'Seldom Seen Kid', 'artist_id' => artist1.id}).save()
# Album.new({'name' => 'Lippy Kids', 'artist_id' => artist1.id}).save()

artists = Artist.load()
albums = Album.load()

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
