
# INDEX

get '/rentals' do
    @rentals = Rental.all()
    @members = Member.all()
    @books = Book.all()
    erb(:'rentals/index')
end

# NEW
get '/rentals/new' do
    @members = Member.all()
    @books = Book.all()
    erb(:'rentals/new')
end

# CREATE
post '/rentals' do
    Rental.new(params).save()
    redirect '/rentals'
end

# SHOW

get '/rentals/:id' do
    @rental = Rental.find(params[:id])
    if @rental
        @member = Member.find(@rental.member_id)
        @book = Book.find(@rental.book_id)
        erb(:'rentals/show')
    else
        redirect '/rentals'
    end
end

# EDIT

get '/rentals/:id/edit' do

    @rental = Rental.find(params[:id])
    if @rental
        @members = Member.all()
        @books = Book.all()
        erb(:'rentals/edit')
    end

end

# UPDATE

put '/rentals/:id' do
    Rental.update(params)
    redirect '/rentals/' + params[:id]
end

# DELETE

delete '/rentals/:id/delete' do
    Rental.delete(params[:id])
    redirect '/rentals'
end
