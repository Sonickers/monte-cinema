class AddTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.integer :price
      t.string :seat
      t.string :type

      t.timestamps
    end
  end
end
