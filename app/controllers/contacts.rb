#retrieve contacts
get '/contacts' do
  @contacts = Contact.all
  erb :"contacts/index"
end

#create contact
get '/contacts/new' do
  @contact = Contact.new
  erb :"contacts/new"
end

post '/contacts' do
  @contact = Contact.create(params[:contact])
  redirect '/contacts'
end

#edit contacts
#need show for new address link for addresses
get '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  erb :"contacts/show"
end

get '/contacts/:contact_id/edit' do
  @contact = Contact.find(params[:contact_id])
  erb :"contacts/edit"
end

put '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  @contact.update(params[:contact])
  redirect '/contacts'
end

#delete contact
delete '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  @contact.delete
  redirect '/contacts'
end


