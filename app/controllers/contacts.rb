get '/' do
  erb :index
end

#display all contacts
get '/contacts' do
  @contacts = Contact.all
  erb :'/contacts/index'
end

#displays the new contact form
get '/contacts/new' do
  erb :"/contacts/new"
end

#creates the new contact from the form
post '/contacts' do
  @contact = Contact.create!(params[:contact])
  redirect '/contacts'
end

#finds a contact by a ceratin id
get '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  erb :'/contacts/show'
end

#displays the page to edit a contact
get '/contacts/:contact_id/edit' do
  @contact = Contact.find(params[:contact_id])
  erb :"/contacts/edit"
end

#updates a contact with new attributes
put '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  @contact.update(params[:contact])
  redirect '/contacts'
end

#deletes a contact
delete '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  @contact.destroy
  redirect '/contacts'
end



