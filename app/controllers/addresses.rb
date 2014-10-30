get '/' do
  erb :'index'
end

# get '/contacts/:contact_id' do #gets you to the id info page
#   @contact = Contact.find(params[:contact_id])
#   erb :"/contacts/show"
# end

get '/contacts/:contact_id/addresses/new' do #gets you to the new contact address page
  @contact = Contact.find(params[:contact_id])
  erb :"/addresses/new"
end

post '/contacts/:contact_id/addresses' do #creates an address
  id = params[:contact_id] #defines the id in a variable
  @contact = Contact.find(params[:contact_id]) #defines the contact by finding it via id
  params[:address][:contact] = @contact #joins the address hash with the contact value
  Address.create(params[:address]) #creates a new address object
  redirect :"/contacts/#{id}" #redirects you to the contact page for the contact with the id definied
end

get '/contacts/:contact_id/addresses/:address_id/edit' do
  @address = Address.find(params[:address_id]) #defines the id in a variable
  @contact = Contact.find(params[:contact_id])
  erb :"addresses/edit"
end

put '/contacts/:contact_id/addresses/:address_id' do
  id = params[:contact_id]
  @address = Address.find(params[:address_id])
  @address.update(params[:address])
  redirect "/contacts/#{id}"
end

delete '/contacts/:contact_id/addresses/:address_id' do
  id = params[:contact_id]
  @address = Address.find(params[:address_id])
  @address.destroy
  redirect "/contacts/#{id}"
end
