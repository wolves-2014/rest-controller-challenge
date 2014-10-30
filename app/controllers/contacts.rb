#displays all the contacts

get '/' do
  "hello world"
end

get '/contacts' do
  @contacts = Contact.all
  erb :"contacts/index"
end

get '/contacts/new' do
  @contact = Contact.new #creates a contact instance that is used in the _form.erb
  erb :'contacts/new'
end

post '/contacts' do
  Contact.create(params[:contact])
  redirect to('/contacts')
  # this works put is clunky:
  # new_name = params[:contact][:name]
  # new_email = params[:contact][:email]
  # new_contact = Contact.create(name: new_name, email: new_email)
end

get '/contacts/:contact_id' do
  # find the contact object with the same @contacts_id
  @contact = Contact.find(params[:contact_id]) #this works
   erb :'contacts/show'
end

get '/contacts/:contact_id/edit' do
  # find the contact object with the same @contacts_id
  @contact = Contact.find(params[:contact_id]) #this works
   erb :'contacts/edit' #, locals: {@contact}
end

#updates contact information
put '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  # @contact.update(name: params[:contact][:name], email: params[:contact][:email]) #This works!
  @contact.update(params[:contact])
  redirect "/contacts/#{@contact.id}"
  # edit contact from edit form
  # "#{@contacts_id}"
  # "#{params[:@contact]}"
end

delete '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id]) #this works
  @contact.destroy
  redirect '/contacts'
end


