class AddPassengerCountToFlight < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :passenger_count, :integer
  end
end
