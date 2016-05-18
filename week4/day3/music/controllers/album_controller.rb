get '/albums' do
    # index
    @albums = Album.all()
    erb(:'album/album_index')
end

get '/albums/new' do
    # new
    @artists = Artist.all()
    erb(:'album/album_new')
end

post '/albums' do
    # create
    album = Album.new(params)
    @album = album.save()
    erb(:'album/album_create')
end

get '/albums/:id' do
    # show
    @album = Album.find(params[:id])
    erb(:'album/album_show')
end

get '/albums/:id/edit' do
    # edit
    @artists = Artist.all()
    @album = Album.find(params[:id])
    erb(:'album/album_edit')
end

put '/albums/:id' do
    #update
    @album = Album.update(params)
    redirect '/albums/' + params[:id]
end

delete '/albums/:id' do
    # delete
    Album.delete(params[:id])
    redirect '/albums'
end
