require 'rails_helper'

RSpec.describe Place, type: :model do
	subject(:place) { build(:place) }

	it { is_expected.to validate_presence_of(:title) }
	it { is_expected.to validate_presence_of(:street) }
	it { is_expected.to validate_presence_of(:city) }
	it { is_expected.to validate_presence_of(:state) }
	it { is_expected.to validate_presence_of(:zip_code) }

	it { is_expected.to validate_uniqueness_of(:title) }

	describe '#address' do
    it 'should return full address' do
      # Test your instance method here
			place.street = '1600 Pennsylvania Ave'
      place.city = 'Washington'
      place.state = 'DC'
      place.zip_code = '20500'

			full_address = place.address

      # Check if the full address matches the expected format
      expect(full_address).to eq('1600 Pennsylvania Ave, Washington, DC, 20500')
    end
  end

end