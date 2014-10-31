get '/' do
  erb :index
end

get '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  erb :"contacts/show"
end

get '/contacts/:contact_id/addresses/new' do
  @contact = Contact.find(params[:contact_id])
  @address = @contact.addresses.create!
  erb :"addresses/new"
end

post '/contacts/:contact_id/addresses' do
  @contact = Contact.find(params[:contact_id])
  @id = params[:contact_id]
  @contact.addresses.create(params[:address])
  redirect "/contacts/#{@id}"
end

get '/contacts/:contact_id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:contact_id])
  @address = Address.find(params[:address_id])
  erb :"addresses/edit"
end

put '/contacts/:contact_id/addresses/:address_id' do
  @address = Address.find(params[:address_id])
  @id = params[:contact_id]
  @address.update(params[:address])
  redirect "/contacts/#{@id}"
end



# get '/contacts/:contact_id/edit' do
#   @contact = Contact.find(params[:contact_id])
#   erb :"contacts/edit"
# end

# put '/contacts/:contact_id' do
#   @contact = Contact.find(params[:contact_id])
#   @contact.update(params[:contact])
#   redirect '/contacts'
# end
