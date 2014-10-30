get '/' do
  erb :index
end

get '/contacts' do #displays all the contacts
  @contacts = Contact.all
  erb :"contacts/index"
end

get '/contacts/new' do #brings you to the page to make a new contact
  erb :"contacts/new"
end

post '/contacts' do #saves the contact information
  @contact = Contact.create!(params[:contact])
  redirect :"/contacts"
end

get '/contacts/:contact_id' do #shows the contact information per contact id
  @contact = Contact.find(params[:contact_id])
  erb :"contacts/show"
end

get '/contacts/:contact_id/edit' do #brings you to the edit page for the contact id
  @contact = Contact.find(params[:contact_id])
  erb :"contacts/edit"
end

put '/contacts/:contact_id' do #allows you to update the contact information
  @contact = Contact.find(params[:contact_id])
  @contact.update(params[:contact])
  redirect "/contacts"
end

delete '/contacts/:contact_id' do #allows you to delete the contact info
  @contact = Contact.find(params[:contact_id])
  @contact.destroy
  redirect "/contacts"
end





