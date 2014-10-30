get '/contacts' do
  @contacts = Contact.all
  erb :"contacts/index"
end

get '/contacts/new' do
  @contact = Contact.new
  erb :"contacts/new"
end

post '/contacts' do
  Contact.create!(params[:contact])
  redirect to "/contacts"
end

get '/contacts/:id/edit' do
  @id = params[:id]
  @contact = Contact.find(@id)
  erb :"contacts/edit"
end

get '/contacts/:id' do
  @id = params[:id]
  @contact = Contact.find(@id)
  erb :"contacts/show"
end

put '/contacts/:id' do
  @id = params[:id]
  @contact = Contact.find(@id)
  @contact.update(params[:contact])
  @contact.save
  redirect to "/contacts/#{@id}"
end

delete '/contacts/:id' do
  @id = params[:id]
  @contact = Contact.find(@id)
  @contact.destroy
  # @contact.save
  redirect to "/contacts"
end
