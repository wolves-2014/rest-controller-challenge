require 'faker'

contacts = []
30.times do
  contacts << Contact.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email
    )
end

contacts.each do |contact|
  rand(1..3).times do
    contact.addresses.create!(
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zip: Faker::Address.zip
      )
  end
end
