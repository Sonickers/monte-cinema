class AddReservationToTickets < ActiveRecord::Migration[6.1]
  def change
    change_table :tickets do |t|
      t.belongs_to :reservation
    end
  end
end
