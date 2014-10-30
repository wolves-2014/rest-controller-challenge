get '/' do
 erb :index
end

get '/contacts' do
 @contacts = Contact.all
 erb :"contacts/index"
end

get '/contacts/new' do
  erb :"contacts/new"
end

post '/contacts' do
  @contact = Contact.new(params[:contact])
  if @contact.save
  redirect "/contacts"
  else
    @error = "Unable to save that contact!"
    erb :"contacts/index"
  end
end

get '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  erb :"contacts/show"
end

get '/contacts/:contact_id/edit' do
  @contact = Contact.find(params[:contact_id])
  erb :"contacts/edit"
end

put '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  @contact.update(params[:contact])
  redirect "contacts/#{@contact.id}"
end

delete '/contacts/:id' do
  Contact.find(params[:id]).destroy
end




