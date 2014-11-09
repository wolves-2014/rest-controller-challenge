get '/' do
  erb :index
end

get '/contacts/new' do
  erb :"contacts/new"
end

post '/contacts' do
  @contact = Contact.create(params[:contact])
  redirect "contacts/#{@contact.id}"
end

get '/contacts/:id' do
  # raise params.inspect
  @contacts = Contact.all
  @contact = Contact.find(params[:id])
  erb :"contacts/show"
end

get '/contacts' do
  @contacts = Contact.all
  erb :"contacts/index"
end

get '/contacts/:id/edit' do
  @contacts = Contact.all
  @contact = Contact.find(params[:id])
  erb :"contacts/edit"
end

post '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.update(params[:contact])
  redirect "contacts/#{params[:id]}"
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect "/contacts"
end


