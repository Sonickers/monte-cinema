class AddTicketDeskToReservations < ActiveRecord::Migration[6.1]
  def change
    change_table :reservations do |t|
      t.belongs_to :ticket_desk
    end
  end
end
