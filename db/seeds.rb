contact1 = Contact.create!(name: "joe", email: "joe@joe.com")
contact2 = Contact.create!(name: "jim", email: "jim@jim.com")

address1 = Address.create!(contact_id: contact1.id, street: "johnson", city: "johnsonville", state: "fl", zip: "33913")
address1 = Address.create!(contact_id: contact2.id, street: "jackson", city: "jacksonville", state: "fl", zip: "33913")
