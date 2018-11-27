ActiveRecord::Schema.define(version: 2018_11_25_180157) do
    create_table "players", force: :cascade do |t|
     t.string "first_name"
     t.string "last_name"
     t.integer "power"
     t.boolean "captain"
     t.datetime "created_at", null: false
     t.datetime "updated_at", null: false
   end
  end
