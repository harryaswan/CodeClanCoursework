require_relative('./models/store')
require_relative('./models/pet')
require('pry-byebug')

# store = Store.new({'name' => 'AviationLovers', 'address' => '4 Birdy Lane, Birdville, Birdshire', 'stock_type'=>'birds'}).save()
# pet1 = Pet.new({'name'=> 'Ginny', 'store_id'=>5, 'p_type' => 'Pigeon', 'image' => 'Image of pigeon'}).save()

stores = Store.load()
pets = Pet.load()

pets[0].edit({'name'=>'Dave'})

binding.pry
nil
