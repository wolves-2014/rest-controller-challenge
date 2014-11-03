require 'faker'

contacts = []
50.times do
  contacts << User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email
    password: 'pass'
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

contacts.each do |contact|
  contact.primary_address = contact.addresses.sample
end

contacts.each do |contact|
  rand(5-10).times do
    contact.contacts << contacts.sample
  end
  contact.contacts.uniq!
  contact.save
end



