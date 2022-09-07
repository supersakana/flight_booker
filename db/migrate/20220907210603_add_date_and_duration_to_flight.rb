class AddDateAndDurationToFlight < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :duration, :integer
    add_column :flights, :date, :datetime
  end
end
