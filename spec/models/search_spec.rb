require 'rails_helper'

RSpec.describe Search, type: :model do
	subject(:search) { build(:search) }

	it { is_expected.to belong_to(:origin) }
	it { is_expected.to belong_to(:destination) }
	it { is_expected.to belong_to(:user).optional }
	it { should accept_nested_attributes_for :origin }
	it { should accept_nested_attributes_for :destination }
end