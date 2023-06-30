class RemoveLatitudeAndLongitudeFromPlace < ActiveRecord::Migration[7.0]
  def change
    remove_column :places, :longitude
    remove_column :places, :latitude
  end
end
