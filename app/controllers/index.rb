get '/' do
  @contact = Contact.find(1)
  @address = Address.find(1)
  erb :"contacts/edit"
end

