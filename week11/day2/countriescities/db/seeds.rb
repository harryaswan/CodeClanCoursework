City.delete_all()
Country.delete_all()
Continent.delete_all()

europe = Continent.create({name: "Europe"});
africa = Continent.create({name: "Africa"});
asia = Continent.create({name: "Asia"});
north_america = Continent.create({name: "North America"});
south_america = Continent.create({name: "South America"});
antartica = Continent.create({name: "Antartica"});
australia = Continent.create({name: "Australia"});

scotland = Country.create({name: "Scotland", continent_id: europe.id})
spain = Country.create({name: "Spain", continent_id: europe.id})
usa = Country.create({name: "United States of America", continent_id: north_america.id})

edinburgh = City.create({name: "Edinburgh", population:500000, country_id:scotland.id})
malaga = City.create({name: "Malaga", population:300000, country_id:spain.id})
new_york = City.create({name: "City of New York", population:8500000, country_id:usa.id})
