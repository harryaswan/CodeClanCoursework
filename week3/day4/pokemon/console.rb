require_relative('db/sql_runner')
require_relative( 'models/pokemon.rb' )
require_relative( 'models/trainer.rb' )
require_relative( 'models/owned_pokemon.rb' )
require( 'pry-byebug' )

OwnedPokemon.delete_all()
Pokemon.delete_all()
Trainer.delete_all()

p1 = Pokemon.new({'name'=>'Pikachu'}).save()
p2 = Pokemon.new({'name'=>'Bulbasaur'}).save()
p3 = Pokemon.new({'name'=>'Charmander'}).save()
p4 = Pokemon.new({'name'=>'Magikarp'}).save()
t1 = Trainer.new({'name'=>'Colin'}).save()
t2 = Trainer.new({'name'=>'Frank'}).save()
t3 = Trainer.new({'name'=>'Molly'}).save()
o1 = OwnedPokemon.new({'trainer_id' => t1.id, 'pokemon_id'=> p1.id}).save()
o4 = OwnedPokemon.new({'trainer_id' => t1.id, 'pokemon_id'=> p4.id}).save()
o2 = OwnedPokemon.new({'trainer_id' => t2.id, 'pokemon_id'=> p3.id}).save()
o3 = OwnedPokemon.new({'trainer_id' => t3.id, 'pokemon_id'=> p2.id}).save()

# sql = "SELECT p.* FROM pokemons p INNER JOIN owned_pokemons op ON p.id=op.pokemon_id INNER JOIN trainers t ON t.id = op.trainer_id WHERE t.name = 'Colin';"

pokemons = Pokemon.all()
trainers = Trainer.all()
owned = OwnedPokemon.all()

binding.pry
nil
