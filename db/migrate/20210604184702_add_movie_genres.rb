class AddMovieGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_genres do |t|
      t.string :name
    end
  end
end
