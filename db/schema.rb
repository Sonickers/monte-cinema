# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_16_144552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "halls", force: :cascade do |t|
    t.integer "seats"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movie_genres", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "length"
    t.string "poster_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "movie_genre_id", null: false
    t.index ["movie_genre_id"], name: "index_movies_on_movie_genre_id"
  end

  create_table "reservation_statuses", force: :cascade do |t|
    t.string "name"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "reservation_status_id"
    t.bigint "seance_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "ticket_desk_id"
    t.index ["reservation_status_id"], name: "index_reservations_on_reservation_status_id"
    t.index ["seance_id"], name: "index_reservations_on_seance_id"
    t.index ["ticket_desk_id"], name: "index_reservations_on_ticket_desk_id"
  end

  create_table "seances", force: :cascade do |t|
    t.datetime "datetime"
    t.bigint "hall_id"
    t.bigint "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hall_id"], name: "index_seances_on_hall_id"
    t.index ["movie_id"], name: "index_seances_on_movie_id"
  end

  create_table "ticket_desks", force: :cascade do |t|
    t.string "connection"
  end

  create_table "ticket_types", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price", precision: 5, scale: 2, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "seat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "reservation_id"
    t.bigint "ticket_type_id", null: false
    t.index ["reservation_id"], name: "index_tickets_on_reservation_id"
    t.index ["ticket_type_id"], name: "index_tickets_on_ticket_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "jti", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
