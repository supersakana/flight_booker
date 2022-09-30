class AddDatetimeToFlights < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :datetime, :datetime
  end
end
