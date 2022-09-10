class AddBookingToPassenger < ActiveRecord::Migration[7.0]
  def change
    add_reference :passengers, :booking, index: true, foreign_key: true
  end
end
