class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.references :user, foreign_key: true, index: true
      t.references :origin, foreign_key: { to_table: :places }
      t.references :destination, foreign_key: { to_table: :places }
      t.float :distance
      t.float :travel_time

      t.timestamps
    end
  end
end
