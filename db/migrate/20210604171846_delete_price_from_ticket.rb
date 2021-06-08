class DeletePriceFromTicket < ActiveRecord::Migration[6.1]
  def change
    remove_column :tickets, :price
  end
end
