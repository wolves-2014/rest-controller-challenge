get '/' do
  erb :index
end

get '/contacts/:contact_id/addresses/new' do
  @contact = Contact.find(params[:contact_id])
  erb :"/addresses/new"
end

post '/contacts/:contact_id/addresses' do
  id = params[:contact_id]
  @contact = Contact.find(params[:contact_id])
  params[:address][:contact] = @contact
  @address = Address.create!(params[:address])
  redirect "/contacts/#{id}"
end

get '/contacts/:contact_id/addresses/:address_id/edit' do
  @address = Address.find(params[:address_id])
  @contact = Contact.find(params[:contact_id])
  erb :"/addresses/edit"
end

put '/contacts/:contact_id/addresses/:address_id' do
  @address = Address.find(params[:address_id])
  @address.update(params[:address])
  id = params[:contact_id]
  redirect "/contacts/#{id}"
end

delete '/contacts/:contact_id/addresses/:address_id' do
  @address = Address.find(params[:address_id])
  @address.destroy
  id = params[:contact_id]
  redirect "/contacts/#{id}"
end
