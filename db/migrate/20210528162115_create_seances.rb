class CreateSeances < ActiveRecord::Migration[6.1]
  def change
    create_table :seances do |t|
      t.date :date
      t.time :time
      t.belongs_to :hall
      t.belongs_to :movie

      t.timestamps
    end
  end
end
