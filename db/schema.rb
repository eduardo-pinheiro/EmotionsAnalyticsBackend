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

ActiveRecord::Schema.define(version: 2019_10_29_232628) do

  create_table "emotions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "anger"
    t.float "contempt"
    t.float "disgusted"
    t.float "fear"
    t.float "joy"
    t.float "sadness"
    t.float "valence"
    t.float "engagement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expressions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "attention"
    t.float "brow_furrow"
    t.float "brow_raise"
    t.float "cheek_raise"
    t.float "chin_raise"
    t.float "dimpler"
    t.float "eye_closure"
    t.float "eye_widen"
    t.float "inner_brow_raise"
    t.float "jaw_drop"
    t.float "lid_tighten"
    t.float "lip_corner_depressor"
    t.float "lip_press"
    t.float "lip_pucker"
    t.float "lip_stretch"
    t.float "lip_suck"
    t.float "mouth_open"
    t.float "nose_wrinkle"
    t.float "smile"
    t.float "smirk"
    t.float "upper_lip_raise"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "occurrences", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "test_id"
    t.bigint "expression_id"
    t.bigint "emotion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "people_appearance_id"
    t.index ["emotion_id"], name: "index_occurrences_on_emotion_id"
    t.index ["expression_id"], name: "index_occurrences_on_expression_id"
    t.index ["people_appearance_id"], name: "index_occurrences_on_people_appearance_id"
    t.index ["test_id"], name: "index_occurrences_on_test_id"
  end

  create_table "people", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "birthday"
  end

  create_table "people_appearances", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "age"
    t.text "gender"
    t.integer "glasses"
  end

  create_table "test_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "start_url"
    t.text "objective"
    t.string "title"
  end

  create_table "tests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "abandoned"
    t.bigint "test_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "people_id"
    t.index ["people_id"], name: "index_tests_on_people_id"
    t.index ["test_type_id"], name: "index_tests_on_test_type_id"
  end

  add_foreign_key "occurrences", "emotions"
  add_foreign_key "occurrences", "expressions"
  add_foreign_key "occurrences", "people_appearances"
  add_foreign_key "occurrences", "tests"
  add_foreign_key "tests", "test_types"
end
