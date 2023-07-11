FactoryBot.define do
  factory :search do
		user { build(:user) }
		origin { build(:place) }
		destination { build(:place) }
  end
end