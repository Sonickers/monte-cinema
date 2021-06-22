require 'administrate/base_dashboard'

class SeanceDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    hall: Field::BelongsTo,
    movie: Field::BelongsTo,
    reservations: Field::HasMany,
    id: Field::Number,
    datetime: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    hall
    movie
    reservations
    id
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    hall
    movie
    reservations
    id
    datetime
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    hall
    movie
    reservations
    datetime
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
