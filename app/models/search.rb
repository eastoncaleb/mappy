class Search < ApplicationRecord
  belongs_to :origin, class_name: "Place"
  belongs_to :destination, class_name: "Place"
  belongs_to :user, optional: true

  accepts_nested_attributes_for :origin, :destination
end
