get '/' do
  erb :"index"
end

get '/contacts' do
  @contacts = Contact.all
  erb :"contacts/index"
end

post '/contacts' do
  @contact = Contact.create!(params[:contact])
  redirect "/contacts"
end

get '/contacts/new' do
  @contact = Contact.new
  erb :"contacts/new"
end

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
  redirect "contacts/#{@contact.id}"
end

delete '/contacts/:contact_id' do
  @contact = Contact.find(params[:contact_id])
  @contact.destroy
  redirect "/contacts"
end


