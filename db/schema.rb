# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20130813083918) do

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id"

  create_table "branches", force: true do |t|
    t.string   "name"
    t.string   "stream"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cheatsheets", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.integer  "semester"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "branch_id"
    t.integer  "university_id"
  end

  add_index "courses", ["branch_id"], name: "index_courses_on_branch_id"
  add_index "courses", ["university_id"], name: "index_courses_on_university_id"

  create_table "departments", force: true do |t|
    t.integer "institution_id"
    t.integer "branch_id"
  end

  add_index "departments", ["branch_id"], name: "index_departments_on_branch_id"
  add_index "departments", ["institution_id"], name: "index_departments_on_institution_id"

  create_table "examquestions", force: true do |t|
    t.integer  "question_id"
    t.integer  "qpaper_id"
    t.integer  "mark"
    t.integer  "qnumber"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "examquestions", ["qpaper_id"], name: "index_examquestions_on_qpaper_id"
  add_index "examquestions", ["question_id"], name: "index_examquestions_on_question_id"
  create_table "institutions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "university_id"
  end

  add_index "institutions", ["university_id"], name: "index_institutions_on_university_id"

  create_table "program_courses", force: true do |t|
    t.integer  "program_id"
    t.integer  "course_id"
    t.integer  "semester"
    t.boolean  "elective"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "program_courses", ["course_id"], name: "index_program_courses_on_course_id"
  add_index "program_courses", ["program_id"], name: "index_program_courses_on_program_id"

  create_table "programs", force: true do |t|
    t.string   "degree_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "university_id"
    t.integer  "branch_id"
  end

  add_index "programs", ["branch_id"], name: "index_programs_on_branch_id"
  add_index "programs", ["university_id"], name: "index_programs_on_university_id"

  create_table "qpapers", force: true do |t|
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
    t.integer  "user_id"
    t.text     "title"
    t.boolean  "official"
  end

  add_index "qpapers", ["course_id"], name: "index_qpapers_on_course_id"
  add_index "qpapers", ["user_id"], name: "index_qpapers_on_user_id"

  create_table "questions", force: true do |t|
    t.text     "qtext"
    t.text     "qdesc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "solutions", force: true do |t|
    t.text     "answer"
    t.integer  "votes"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "question_id"
  end

  add_index "solutions", ["question_id"], name: "index_solutions_on_question_id"
  add_index "solutions", ["user_id"], name: "index_solutions_on_user_id"

  create_table "units", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
  end

  add_index "units", ["course_id"], name: "index_units_on_course_id"

  create_table "universities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "is_admin"
    t.integer  "university_id"
    t.integer  "program_id"
  end

  add_index "users", ["program_id"], name: "index_users_on_program_id"
  add_index "users", ["university_id"], name: "index_users_on_university_id"

end
