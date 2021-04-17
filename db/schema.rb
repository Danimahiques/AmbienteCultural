# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_01_153407) do

  create_table "image", primary_key: "image_id", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "caption", null: false
    t.integer "num_votes", default: 0, null: false, unsigned: true
    t.integer "total_score", default: 0, null: false, unsigned: true
    t.decimal "rating", precision: 8, scale: 2, default: "0.0", null: false
  end

  create_table "image_vote", primary_key: ["image_id", "user_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "image_id", null: false, unsigned: true
    t.integer "user_id", null: false, unsigned: true
    t.integer "score", limit: 1, default: 0, null: false, unsigned: true
    t.string "review", limit: 4000
  end

  create_table "libros", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "titulo"
    t.string "genero"
    t.integer "paginas"
    t.string "autor"
    t.integer "puntuacion"
    t.string "editorial"
    t.string "anyo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "peliculas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "titulo"
    t.string "director"
    t.string "actores"
    t.string "anyo"
    t.string "premios"
    t.string "duracion"
    t.string "pais"
    t.integer "puntuacion"
    t.string "imagen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "num_votos", default: 0, null: false, unsigned: true
    t.decimal "rating", precision: 8, scale: 2, default: "0.0", null: false
  end

  create_table "peliculas_votos", primary_key: ["peliculas_id", "user_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "peliculas_id", null: false, unsigned: true
    t.integer "user_id", null: false, unsigned: true
    t.integer "puntuacion_total", limit: 1, default: 0, null: false, unsigned: true
    t.string "opinion", limit: 4000
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "usuarios", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre", limit: 100, null: false
    t.string "apellido", limit: 150
    t.string "nickname", limit: 50
    t.string "password_digest", limit: 35, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "usuaris", primary_key: "idusuari", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "nom", limit: 50, null: false
    t.string "cognom", limit: 150, null: false
    t.string "correu", limit: 250, null: false
    t.string "clauusuari", limit: 250, null: false
    t.string "tipuscompte", limit: 250, default: "Normal", null: false
    t.date "fecha"
    t.string "imatgeperfil"
  end

  create_table "votes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "topic_id"
  end

  add_foreign_key "votes", "peliculas", column: "topic_id", name: "votes_ibfk_1"
end
