class AddReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.belongs_to :reservation_status
      t.belongs_to :seance

      t.timestamps
    end
  end
end
