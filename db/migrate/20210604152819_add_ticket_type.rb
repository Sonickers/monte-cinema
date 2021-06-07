class AddTicketType < ActiveRecord::Migration[6.1]
  def change
    create_table :ticket_types do |t|
      t.string :name, null: false
      t.decimal :price, null: false, precision: 5, scale: 2
    end

    change_table :tickets do |t|
      t.belongs_to :ticket_type, null: false
      t.remove :group
    end
  end
end
