require 'administrate/base_dashboard'

class MovieDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    movie_genre: Field::BelongsTo,
    id: Field::Number,
    title: Field::String,
    length: Field::Number,
    poster_url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    movie_genre
    title
    length
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    movie_genre
    title
    length
    poster_url
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    movie_genre
    title
    length
    poster_url
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  def display_resource(movie)
    movie.title.to_s
  end
end
