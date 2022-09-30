class RemoveTimeAndDateFromFlights < ActiveRecord::Migration[7.0]
  def change
    remove_column :flights, :duration
    remove_column :flights, :passenger_count
    remove_column :flights, :date
    remove_column :flights, :time
  end
end
