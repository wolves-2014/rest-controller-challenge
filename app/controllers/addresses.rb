get '/contacts/:contact_id/addresses/new' do
	@contact = Contact.find(params[:contact_id])
	erb :"addresses/new"
end

# coming from /addresses/new form
post '/contacts/:contact_id/addresses' do
	@contact = Contact.find(params[:contact_id])
	@address = @contact.addresses.create(params[:address])
	erb :"contacts/show"
end

get '/contacts/:contact_id/addresses/:address_id/edit' do
	@contact = Contact.find(params[:contact_id])
	@address = Address.find(params[:address_id])
	erb :"addresses/edit"
end

post '/contacts/:contact_id/addresses/:address_id' do
	@contact = Contact.find(params[:contact_id])
	@address = @contact.addresses.create(params[:address])
	erb :"contacts/show"
end
