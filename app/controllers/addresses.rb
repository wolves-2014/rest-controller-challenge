get '/contacts/:id/addresses/new' do

  @address = Address.new
  @contact = Contact.find(params[:id])
  erb :"addresses/new"
end

# get '/addresses/new'do
#   @address = Address.new
#   erb :"addresses/new"

# end


post '/contacts/:id/addresses' do
  @contact = Contact.find(params[:id])
  @address = @contact.addresses.create! street: params[:street], city: params[:city], state: params[:state], zip: params[:zip]
  redirect "/contacts/#{@contact.id}"
end

get '/contacts/:id/addresses/:address_id/edit' do
  @contact = Contact.find(params[:id])
  @address = Address.find_by(id: params[:address_id])
  erb :'addresses/edit'
end

post '/contacts/:id/addresses/:address_id' do
  @contact = Contact.find_by(id: params[:id])
  @address = Address.find_by(id: params[:address_id])
  @address.update(street: params[:street], city: params[:city], state: params[:state], zip: params[:zip])

  redirect "/contacts/#{@contact.id}"
end
