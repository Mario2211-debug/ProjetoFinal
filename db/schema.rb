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

ActiveRecord::Schema.define(version: 2021_03_05_110935) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.integer "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addempresas", force: :cascade do |t|
    t.integer "empresa_id"
    t.integer "situacao_id"
    t.integer "user_id"
    t.integer "admin_id"
    t.string "observacao"
    t.string "nome"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_addempresas_on_admin_id"
    t.index ["empresa_id"], name: "index_addempresas_on_empresa_id"
    t.index ["situacao_id"], name: "index_addempresas_on_situacao_id"
    t.index ["user_id"], name: "index_addempresas_on_user_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "nome", limit: 80
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assuntos", force: :cascade do |t|
    t.string "nome", limit: 80
    t.boolean "ativo", default: true, null: false
    t.integer "empresa_id"
    t.integer "atividade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atividade_id"], name: "index_assuntos_on_atividade_id"
    t.index ["empresa_id"], name: "index_assuntos_on_empresa_id"
  end

  create_table "atividades", force: :cascade do |t|
    t.string "nome", limit: 80
    t.boolean "activo", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "avaliacaos", force: :cascade do |t|
    t.integer "valor", limit: 80
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "queixa_id", null: false
  end

  create_table "contactos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "empresa_id"
    t.integer "tipo"
    t.string "valor"
    t.boolean "status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_contactos_on_empresa_id"
    t.index ["user_id"], name: "index_contactos_on_user_id"
  end

  create_table "empresas", force: :cascade do |t|
    t.integer "atividade_id"
    t.integer "situacao_id"
    t.string "nome", limit: 80
    t.string "nif", limit: 50
    t.string "responsavel", limit: 60
    t.string "email"
    t.string "sobre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "rank", limit: 100, default: 0.0, null: false
    t.index ["atividade_id"], name: "index_empresas_on_atividade_id"
    t.index ["situacao_id"], name: "index_empresas_on_situacao_id"
  end

  create_table "enderecos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "empresa_id"
    t.integer "cidade"
    t.integer "destrito"
    t.string "bairro"
    t.string "rua"
    t.integer "numero"
    t.text "observacao"
    t.date "data_execucao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_enderecos_on_empresa_id"
    t.index ["user_id"], name: "index_enderecos_on_user_id"
  end

  create_table "historico_empresarials", force: :cascade do |t|
    t.integer "empresa_id"
    t.integer "situacao_id"
    t.integer "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_historico_empresarials_on_admin_id"
    t.index ["empresa_id"], name: "index_historico_empresarials_on_empresa_id"
    t.index ["situacao_id"], name: "index_historico_empresarials_on_situacao_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.bigint "actor_id"
    t.string "notify_type", null: false
    t.string "target_type"
    t.bigint "target_id"
    t.string "second_target_type"
    t.bigint "second_target_id"
    t.string "third_target_type"
    t.bigint "third_target_id"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "notify_type"], name: "index_notifications_on_user_id_and_notify_type"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "ordems", force: :cascade do |t|
    t.integer "empresa_id"
    t.integer "user_id"
    t.integer "queixa_id"
    t.integer "numero", limit: 80
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_ordems_on_empresa_id"
    t.index ["queixa_id"], name: "index_ordems_on_queixa_id"
    t.index ["user_id"], name: "index_ordems_on_user_id"
  end

  create_table "perfil_empresarials", force: :cascade do |t|
    t.integer "user_id"
    t.integer "empresa_id"
    t.integer "situacao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "observacao"
    t.index ["empresa_id"], name: "index_perfil_empresarials_on_empresa_id"
    t.index ["situacao_id"], name: "index_perfil_empresarials_on_situacao_id"
    t.index ["user_id"], name: "index_perfil_empresarials_on_user_id"
  end

  create_table "queixas", force: :cascade do |t|
    t.integer "sentimento_id"
    t.integer "avaliacao_id"
    t.integer "user_id"
    t.integer "empresa_id"
    t.integer "situacao_id"
    t.integer "assunto_id"
    t.string "titulo", limit: 80
    t.text "descricao"
    t.string "replica"
    t.string "slug"
    t.string "mensagem"
    t.integer "novos_negocios"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assunto_id"], name: "index_queixas_on_assunto_id"
    t.index ["avaliacao_id"], name: "index_queixas_on_avaliacao_id"
    t.index ["empresa_id"], name: "index_queixas_on_empresa_id"
    t.index ["sentimento_id"], name: "index_queixas_on_sentimento_id"
    t.index ["situacao_id"], name: "index_queixas_on_situacao_id"
    t.index ["user_id"], name: "index_queixas_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "nome"
    t.string "empresa"
    t.string "assunto"
    t.string "situacao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sentimentos", force: :cascade do |t|
    t.string "nome", limit: 80
    t.boolean "activo", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "situacaos", force: :cascade do |t|
    t.string "nome", limit: 80
    t.string "escopo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "nome", limit: 80
    t.string "email"
    t.boolean "ativo", default: true, null: false
    t.string "B_I"
    t.integer "kind"
    t.integer "empresa_id"
    t.string "password_digest"
    t.string "remember_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_users_on_empresa_id"
  end

  create_table "votos", force: :cascade do |t|
    t.integer "empresa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addempresas", "admins"
  add_foreign_key "addempresas", "empresas"
  add_foreign_key "addempresas", "situacaos"
  add_foreign_key "addempresas", "users"
  add_foreign_key "assuntos", "atividades"
  add_foreign_key "assuntos", "empresas"
  add_foreign_key "avaliacaos", "queixas"
  add_foreign_key "contactos", "empresas"
  add_foreign_key "contactos", "users"
  add_foreign_key "empresas", "atividades"
  add_foreign_key "empresas", "situacaos"
  add_foreign_key "enderecos", "empresas"
  add_foreign_key "enderecos", "users"
  add_foreign_key "historico_empresarials", "admins"
  add_foreign_key "historico_empresarials", "empresas"
  add_foreign_key "historico_empresarials", "situacaos"
  add_foreign_key "ordems", "empresas"
  add_foreign_key "ordems", "queixas"
  add_foreign_key "ordems", "users"
  add_foreign_key "perfil_empresarials", "empresas"
  add_foreign_key "perfil_empresarials", "situacaos"
  add_foreign_key "perfil_empresarials", "users"
  add_foreign_key "queixas", "assuntos"
  add_foreign_key "queixas", "avaliacaos"
  add_foreign_key "queixas", "empresas"
  add_foreign_key "queixas", "sentimentos"
  add_foreign_key "queixas", "situacaos"
  add_foreign_key "queixas", "users"
  add_foreign_key "taggings", "tags"
  add_foreign_key "users", "empresas"
end
