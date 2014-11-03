get '/contacts/new' do
	erb :'contacts/new'
end

get '/contacts/:contact_id/edit' do
	@contact = User.find(params[:contact_id])
	erb :"contacts/edit"
end

get '/my_contacts' do
	@contacts = User.all
	erb :"contacts/index"
end

post '/contacts' do	# gets values from form through new.erb
	@contact = User.create(params[:contact])
	redirect	:"contacts/#{@contact.id}" # redirect to line 20
end

get '/contacts/:contact_id' do
	@contact = User.find(params[:contact_id])
	erb :"contacts/show"
end

put '/contacts/:contact_id' do # getting data from contacts/edit.erb form
	@contact = User.find(params[:contact_id])
	@contact.update(params[:contact])
	redirect	:"contacts/#{@contact.id}"
end

delete '/contacts/:contact_id' do	# getting data from contacts/edit.erb form
	@contact = User.find(params[:contact_id])
	@contact.destroy
	redirect :"contacts" # redirect to line 10
end
