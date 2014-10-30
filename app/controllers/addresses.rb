get "/contacts/:contact_id/addresses/new" do
  @contact = Contact.find(params[:contact_id])
  erb :'/addresses/new'
end

post "/contacts/:contact_id/addresses" do
  @contact = Contact.find(params[:contact_id])
  id = params[:contact_id]
  params[:address][:contact] = @contact
  Address.create!(params[:address])
  redirect "/contacts/#{id}"
end

get '/contacts/:contact_id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id])
  erb :"addresses/edit"
end


delete '/contacts/:contact_id/addresses/:address_id' do
    id = params[:contact_id]
    @address = Address.find(params[:address_id])
    @address.destroy
    redirect "/contacts/#{id}"
end

put '/contacts/:contact_id/addresses/:address_id' do
    @contact = Contact.find(params[:contact_id])
    id = params[:contact_id]
    @address = Address.find(params[:address_id])
    @address.update(params[:address])
    redirect "/contacts/#{id}"
end
