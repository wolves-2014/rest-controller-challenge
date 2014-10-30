get '/contacts/:contact_id/addresses/new' do
  @contact = Contact.find(params[:contact_id])
  erb :"addresses/new"
end

get '/contacts/:contact_id/addresses' do
  @contact = Contact.find(params[:contact_id])
  erb :"contacts/show"
end

post '/contacts/:contact_id/addresses' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.new(params[:address])
  @contact.addresses << @address
  @address.save
  redirect "contacts/#{@contact.id}/addresses"
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
  erb :"contacts/show"
end
