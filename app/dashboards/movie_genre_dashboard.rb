require "administrate/base_dashboard"

class MovieGenreDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    movies: Field::HasMany,
    id: Field::Number,
    name: Field::String,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    movies
    id
    name
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    movies
    id
    name
  ].freeze

  FORM_ATTRIBUTES = %i[
    movies
    name
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  def display_resource(movie_genre)
    "#{movie_genre.name}"
  end
end
