get "/contacts/:contact_id/addresses/new" do
  @contact = Contact.find(params[:contact_id])
  @address = @contact.addresses.build
  erb :"addresses/new"
end

post "/contacts/:contact_id/addresses" do
  @contact = Contact.find(params[:contact_id])
  @address = @contact.addresses.build(params[:address])
  if @address.save
    redirect to("/contacts/#{@contact.id}")
  else
    erb :"addresses/new"
  end
end

get "/contacts/:contact_id/addresses/:id/edit" do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:id])
  erb :"addresses/edit"
end

put "/contacts/:contact_id/addresses/:id" do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:id])
  @address.update!(params[:address])
  redirect to("/contacts/#{@contact.id}")
end
