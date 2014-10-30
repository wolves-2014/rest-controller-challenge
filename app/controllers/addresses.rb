
get '/contacts/:id/addresses/new' do
  @id = params[:id]
  @contact = Contact.find(@id)
  @address = Address.new
  erb :"addresses/new"
end

post '/contacts/:id/addresses' do
  @address = Address.create!(params[:address])
  @address.contact_id = params[:id]
  @address.save
  redirect to "/contacts"
end


get '/contacts/:id/addresses/:address_id/edit' do
  @id = params[:id]
  @address_id = params[:address_id]
  @contact = Contact.find(@id)
  @address = Address.find(@address_id)

  erb :"addresses/edit"
end

put '/contacts/:id/addresses/:address_id' do
  @contact_id = params[:id]
  @address_id = params[:address_id]
  @address = Address.find(@address_id)
  @address.update(params[:address])
  @address.save
  redirect to "/contacts/#{@contact_id}"
end

# get '/contacts/:id/addresses' do
#   redirect to "/contacts"
# end

# post '/contacts/:id/addresses/new' do
#   Address.create!(params[:address])
#   redirect to "/contacts"
# end

# get '/contacts/:id/edit' do
#   @id = params[:id]
#   @contact = Contact.find(@id)
#   erb :"contacts/edit"
# end

# get '/contacts/:id' do
#   @id = params[:id]
#   @contact = Contact.find(@id)
#   erb :"contacts/show"
# end

# put '/contacts/:id' do
#   @id = params[:id]
#   @contact = Contact.find(@id)
#   @contact.update(params[:contact])
#   @contact.save
#   redirect to "/contacts/#{@id}"
# end

# delete '/contacts/:id' do
#   @id = params[:id]
#   @contact = Contact.find(@id)
#   @contact.destroy
#   # @contact.save
#   redirect to "/contacts"
# end
