require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    reservations: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    jti: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    role: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    reservations
    id
    email
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    reservations
    id
    email
    encrypted_password
    jti
    reset_password_token
    reset_password_sent_at
    remember_created_at
    created_at
    updated_at
    role
  ].freeze

  FORM_ATTRIBUTES = %i[
    reservations
    email
    encrypted_password
    jti
    reset_password_token
    reset_password_sent_at
    remember_created_at
    role
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  def display_resource(user)
    "(#{user.id}) #{user.email}"
  end
end
