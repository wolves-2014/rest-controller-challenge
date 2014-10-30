get '/contacts' do
  @contacts = Contact.all
  erb :"/contacts/index"
end

get '/contacts/new' do
  erb :"contacts/new"
end

post '/contacts' do
  Contact.create!(params[:contact])
  redirect '/contacts'
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :"contacts/show"
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :"contacts/edit"
end

put '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.update(params[:contact])
  redirect "/contacts/#{@contact.id}"
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect '/contacts'
end

