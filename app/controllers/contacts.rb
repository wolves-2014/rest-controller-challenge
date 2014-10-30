get '/contacts' do

  @contacts = Contact.all

  erb :"/contacts/index"
end

get '/contacts/new' do

  @contact = Contact.new
  erb :"contacts/new"
end

post '/contacts' do
Contact.create!(name: params[:name], email: params[:email])

  redirect "/contacts"
end

get '/contacts/:contact_id' do

  @contact = Contact.find_by(id: params[:contact_id])

  erb :'contacts/show'
end

get '/contacts/:contact_id/edit' do
  @contact = Contact.find_by(id: params[:contact_id])
  erb :'contacts/edit'
end

post '/contacts/:contact_id' do
  @contact = Contact.find_by(id: params[:contact_id])
  @contact.update(name: params[:name], email: params[:email])

  redirect "/contacts/#{@contact.id}"
end
