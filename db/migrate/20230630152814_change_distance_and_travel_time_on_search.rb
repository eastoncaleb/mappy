class ChangeDistanceAndTravelTimeOnSearch < ActiveRecord::Migration[7.0]
  def change
    change_column :searches, :travel_time, :string
    change_column :searches, :distance, :string
  end
end
