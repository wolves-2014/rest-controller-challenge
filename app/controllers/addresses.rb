get '/contacts/:id/addresses/new' do
  @contacts = Contact.all
  @contact = Contact.find(params[:id])
  erb :"addresses/new"
end

post '/contacts/:id/addresses' do
  @contacts = Contact.all
  @contact = Contact.find(params[:id])
  @address = Address.create(params[:address].merge(contact_id: @contact.id))
  redirect "/contacts/#{@contact.id}/addresses"
end

get '/contacts/:id/addresses' do
  @contacts = Contact.all
  @contact = Contact.find(params[:id])
  erb :"contacts/show"
end

get '/contacts/:contact_id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id])
  erb :"addresses/edit"
end

post '/contacts/:contact_id/addresses/:address_id' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id])
  @address.update(params[:address])
  redirect :"contacts/#{params[:contact_id]}"
end
