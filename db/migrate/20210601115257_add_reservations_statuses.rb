class AddReservationsStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :reservation_statuses do |t|
      t.string :name
    end
  end
end
