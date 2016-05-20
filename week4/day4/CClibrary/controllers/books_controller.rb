require_relative('../models/book.rb')

get '/books' do
  @books = Book.all
  erb :'books/index'
end

get '/books/new' do
  erb :'books/new'
end

get '/books/:id' do
    @book = Book.find(params[:id])
    if @book
        erb :'books/show'
    else
        redirect '/books'
    end
end

get '/books/:id/edit' do
    @book = Book.find(params[:id])
    erb(:'books/edit')
end

post '/books' do
  @book = Book.new(params)
  @book.save
  redirect "/books"
end

put '/books/:id' do
    Book.update(params)
    redirect '/books/' + params[:id]
end

delete '/books/:id/delete' do
    Book.delete(params[:id])
    redirect '/books'
end
