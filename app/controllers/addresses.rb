get '/contacts/:id/addresses/new' do
  @contact = Contact.find(params[:id])
  erb :"addresses/new"
end

post '/contacts/:id/addresses' do
  @contact = Contact.find(params[:id])
  @contact.addresses.create!(params[:address])
  redirect "/contacts/#{@contact.id}"
end

get '/contacts/:id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:id])
  @address = @contact.addresses.find(params[:address_id])
  erb :"addresses/edit"
end

put '/contacts/:id/addresses/:address_id' do
  @contact = Contact.find(params[:id])
  @address = @contact.addresses.find(params[:address_id])
  @address.update(params[:address])
  redirect "/contacts/#{@contact.id}"
end

delete '/contacts/:id/addresses/:address_id' do
  @contact = Contact.find(params[:id])
  @address = @contact.addresses.find(params[:address_id])
  @address.destroy
  redirect "/contacts/#{@contact.id}"
end