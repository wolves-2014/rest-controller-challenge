@joe = Contact.create! name: "Joe Blow", email: "joeblow@example.com"
    @address = @joe.addresses.create! street: "334 golden street", city: "Chicago", state: "California"
