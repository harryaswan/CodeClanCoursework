Artist.delete_all()
Album.delete_all()
Gig.delete_all()
Venue.delete_all()

a1 = Artist.create({name: "Oasis"})
a2 = Artist.create({name: "Blur"})

Album.create({title: "Greatest Hits", artist_id: a1.id})
Album.create({title: "Great Escape", artist_id: a2.id})

v1 = Venue.create({name: "O2 Arena", location:"London", capacity:50000})
v2 = Venue.create({name: "Corn Exchange", location:"Edinburgh", capacity:20000})

Gig.create({price: 32.89, date:"30/03/2017", artist_id: a1.id, venue_id: v1.id})
Gig.create({price: 12.00, date:"07/06/2017", artist_id: a2.id, venue_id: v2.id})
