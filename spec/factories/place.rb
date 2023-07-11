FactoryBot.define do
  factory :place do
		title { Faker::Movies::HarryPotter.location }
		street { Faker::Address.street_address }
		city { Faker::Address.city }
		state { Faker::Address.state }
		zip_code { Faker::Address.zip_code }
  end
end