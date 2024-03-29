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

ActiveRecord::Schema.define(version: 2019_06_20_192556) do

  create_table "metadata", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.string "right_or_wrong"
    t.index ["question_id"], name: "index_metadata_on_question_id"
    t.index ["user_id"], name: "index_metadata_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "category"
    t.string "difficulty"
    t.string "mult_or_boo"
    t.string "question"
    t.string "correct_answer"
    t.string "incorrect_answers"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "high_score"
  end

end
