class RemoveDateFromFlights < ActiveRecord::Migration[7.0]
  def change
    remove_column :flights, :date, :datetime
  end
end
