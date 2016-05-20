require_relative('../models/member.rb')


get '/members' do
  @members = Member.all()
  erb :'members/index'
end

get '/members/new' do
  erb :'members/new'
end

get '/members/:id' do
    @member = Member.find(params[:id])
    if @member
        erb :'members/show'
    else
        redirect '/members'
    end
end

get '/members/:id/edit' do
end

post '/members' do
  @member = Member.new(params)
  @member.save
  redirect '/members'
end

put '/members/:id' do
    Member.update(params)
    redirect '/members/' + params[:id]
end

delete '/members/:id/delete' do
    Member.delete(params[:id])
    redirect '/members'
end
