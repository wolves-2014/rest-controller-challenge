get '/' do
  erb :'../views/index'
end

get '/contacts' do
  @contacts = Contact.all
  erb :'contacts/index'
end

get '/contacts/new' do
  # @contact = Contact.new
  erb :'/contacts/new'
end

post '/contacts' do
  @contact = Contact.create(params[:contact])
  redirect :"contacts"
end

get '/contacts/:contact_id' do
  # id = params[:id]
  # raise id.to_s
  @contact = Contact.find(params[:contact_id])
  erb :'/contacts/show'
end


get '/contacts/:contact_id/edit' do
  @contact = Contact.find(params[:contact_id])
  erb :'/contacts/edit'
end

delete '/contacts/:contact_id' do
    @contact = Contact.find(params[:contact_id])
    @contact.destroy
    redirect :'contacts'
end

put '/contacts/:contact_id' do
    @contact = @contact = Contact.find(params[:contact_id])
    @contact.update(params[:contact])
    redirect :'contacts'
end






