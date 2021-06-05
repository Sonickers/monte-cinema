class AddGenreReferenceToMovie < ActiveRecord::Migration[6.1]
  def change
    change_table :movies do |t|
      t.remove :genre, type: :string
      t.belongs_to :movie_genre
    end
  end
end
