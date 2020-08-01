namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    #   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .
    %x( rails db:drop db:create db:migrate )
  	#   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .
  	kinds = %w(Amigo Comercial Conhecido)
  	kinds.each do |kind|
  		Kind.create!(
  			description: kind
  		)
  	end
  	#   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .
  	100.times do |i|
  		Contact.create!(
  			name: Faker::Name.name,
  			email: Faker::Internet.email,
  			birthdate: Faker::Date.between(from: 30.years.ago, to: 16.years.ago),
  			kind_id: Kind.all.sample.id
  		)
  	end
    #   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .
    Contact.all.each do |c|
      rand(1..5).times do |i|
        Phone.create!(
          number: Faker::PhoneNumber.cell_phone,
          contact_id: c.id
        )
      end
    end
    #   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .
    Contact.all.each do |c|
      rand(1..5).times do |i|
        Phone.create!(
          number: Faker::PhoneNumber.cell_phone,
          contact_id: c.id
        )
      end
    end
    #   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .
    Contact.all.each do |c|
      Address.create!(
        city: Faker::Address.city,
        street: Faker::Address.street_name,
        contact_id: c.id
      )
    end
    #   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .
  end
end
