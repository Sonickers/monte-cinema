class CreateHalls < ActiveRecord::Migration[6.1]
    def change
        create_table :halls do |t|
            t.integer :seats
            t.string :name
    
            t.timestamps
        end
    end
end