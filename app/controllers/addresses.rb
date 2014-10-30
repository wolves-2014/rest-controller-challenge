
get '/contacts/:contact_id/addresses/new' do
  @contact = Contact.find(params[:contact_id])
  @address = @contact.addresses[0]
  erb :"addresses/new"
end

post '/contacts/:contact_id/addresses' do
  @contact = Contact.find(params[:contact_id])
  @this_contacts_addresses = @contact.addresses.new(params[:address])
  if @this_contacts_addresses.save
    redirect '/contacts'
  else
    @error = "That address did not work!"
    erb :"contacts/index"
  end
end

get '/contacts/:contact_id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id])
  erb :'addresses/edit'
end

put '/contacts/:contact_id/addresses/:address_id' do
  @contact = Contact.find(params[:contact_id])
  @this_contacts_address= @contact.addresses.find(params[:address_id])
  if @this_contacts_address.update_attributes(params[:address])
    redirect '/contacts'
  else
    @error = "Your edit failed!"
    erb :"contacts/index"
  end
end

delete '/contacts/:contact_id/addresses/:address_id' do
  @contact = Contact.find(params[:contact_id])
  @contacts_addresses = @contact.addresses.find(params[:address_id])
  @contacts_addresses.destroy
  redirect "/contacts/#{@contact.id}"
end








