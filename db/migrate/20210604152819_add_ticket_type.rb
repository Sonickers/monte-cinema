class AddTicketType < ActiveRecord::Migration[6.1]
  def change
    create_table :ticket_types do |t|
      t.string :name
      t.integer :price
    end

    change_table :tickets do |t|
      t.belongs_to :ticket_type
      t.remove :group
    end
  end
end
