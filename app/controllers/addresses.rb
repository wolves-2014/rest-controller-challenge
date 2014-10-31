get '/contacts/:contact_id/addresses/new' do
  # "this is the addresses page"
  @contact = Contact.find(params[:contact_id])
  @address = Address.new
  erb :"addresses/new"
end

post '/contacts/:contact_id/addresses' do
  # @contact = Contact.find(params[:contact_id])
  address = Address.create(params[:address])
  address.update(contact_id: params[:contact_id])
  # "Hello World #{params[:address]}"
  # redirect '/contacts/' + '#{params[:contact_id]}'
  redirect "/contacts/#{params[:contact_id]}"
end

# http://localhost:9393/contacts/3/addresses/new
# contacts/2