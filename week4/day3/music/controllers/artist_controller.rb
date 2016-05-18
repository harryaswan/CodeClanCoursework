get '/artists' do
    # index
    @artists = Artist.all()
    erb(:'artist/artist_index')
end

get '/artists/new' do
    # new
    erb(:'artist/artist_new')
end

post '/artists' do
    # create
    artist = Artist.new(params)
    @artist = artist.save()
    erb(:'artist/artist_create')
end

get '/artists/:id' do
    # show
    @artist = Artist.find(params[:id])
    erb(:'artist/artist_show')
end

get '/artists/:id/edit' do
    # edit
    @artist = Artist.find(params[:id])
    erb(:'artist/artist_edit')
end

put '/artists/:id' do
    #update
    @artist = Artist.update(params)
    redirect '/artists/' + params[:id]
end

delete '/artists/:id' do
    # delete
    Artist.delete(params[:id])
    redirect '/artists'
end
