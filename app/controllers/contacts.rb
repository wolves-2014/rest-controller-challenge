get '/contacts/new' do
	erb :'contacts/new'
end

get '/contacts/:contact_id/edit' do
	@contact = Contact.find(params[:contact_id])
	erb :"contacts/edit"
end

get '/contacts' do
	@contacts = Contact.all
	erb :"contacts/index"
end

post '/contacts' do
	# gets values from form through new.erb
	@contact = Contact.create(params[:contact])
	redirect	:"contacts/#{@contact.id}"
	# redirect to line 22
end

get '/contacts/:contact_id' do
	@contact = Contact.find(params[:contact_id])
	erb :"contacts/show"
end

put '/contacts/:contact_id' do
	@contact = Contact.find(params[:contact_id])
	@contact.update(params[:contact])
	redirect	:"contacts/#{@contact.id}"
end

delete '/contacts/:contact_id' do
	@contact = Contact.find(params[:contact_id])
	@contact.destroy
	redirect :"contacts"
end
