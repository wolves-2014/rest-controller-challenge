get '/contacts/:contact_id/addresses/new' do
	@contact = User.find(params[:contact_id])
	erb :"addresses/new"
end

post '/contacts/:contact_id/addresses' do # coming from /addresses/new form
	@contact = User.find(params[:contact_id])
	@address = @contact.addresses.create(params[:address])
	erb :"contacts/show"
end

get '/contacts/:contact_id/addresses/:address_id/edit' do
	@contact = User.find(params[:contact_id])
	@address = Address.find(params[:address_id])
	erb :"addresses/edit"
end

put '/contacts/:contact_id/addresses/:address_id' do
	@address = Address.find(params[:address_id])
	@address.update(params[:address])
	redirect	:"contacts/#{params[:contact_id]}"
end

delete '/contacts/:contact_id/addresses/:address_id' do
	@address = Address.find(params[:address_id])
	@address.destroy
	redirect	:"contacts/#{params[:contact_id]}"
end
