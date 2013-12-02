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

ActiveRecord::Schema.define(version: 20131202210903) do

  create_table "accepted_solutions", force: true do |t|
    t.boolean  "accept"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "solution_id"
    t.integer  "user_id"
  end

  add_index "accepted_solutions", ["solution_id"], name: "index_accepted_solutions_on_solution_id"
  add_index "accepted_solutions", ["user_id"], name: "index_accepted_solutions_on_user_id"

  create_table "admins", force: true do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["user_id"], name: "index_admins_on_user_id"

  create_table "authentications", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id"

  create_table "branches", force: true do |t|
    t.string   "name"
    t.string   "stream"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "branch_id"
    t.boolean  "practical"
  end

  add_index "courses", ["branch_id"], name: "index_courses_on_branch_id"

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
    t.integer  "user_id"
    t.integer  "subquestion_no"
    t.integer  "subsubqno"
  end

  add_index "examquestions", ["qpaper_id"], name: "index_examquestions_on_qpaper_id"
  add_index "examquestions", ["question_id"], name: "index_examquestions_on_question_id"
  add_index "examquestions", ["user_id"], name: "index_examquestions_on_user_id"

  create_table "exams", force: true do |t|
    t.date     "date"
    t.string   "session"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "university_course_id"
  end

  add_index "exams", ["university_course_id"], name: "index_exams_on_university_course_id"

  create_table "institutions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "university_id"
  end

  add_index "institutions", ["university_id"], name: "index_institutions_on_university_id"

  create_table "notes", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
    t.integer  "unit_id"
    t.integer  "user_id"
    t.string   "title"
    t.string   "html_content"
    t.string   "text"
    t.integer  "topic_id"
  end

  add_index "notes", ["course_id"], name: "index_notes_on_course_id"
  add_index "notes", ["topic_id"], name: "index_notes_on_topic_id"
  add_index "notes", ["unit_id"], name: "index_notes_on_unit_id"
  add_index "notes", ["user_id"], name: "index_notes_on_user_id"

  create_table "outdated_courses_updated_courses", id: false, force: true do |t|
    t.integer "outdated_course_id"
    t.integer "updated_course_id"
  end

  add_index "outdated_courses_updated_courses", ["outdated_course_id", "updated_course_id"], name: "ocs_ucs_on_outdated_course_id_and_updated_course_id", unique: true

  create_table "program_university_courses", force: true do |t|
    t.integer  "program_id"
    t.integer  "university_course_id"
    t.integer  "semester"
    t.boolean  "elective"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "credits"
    t.integer  "elective_no"
  end

  add_index "program_university_courses", ["program_id"], name: "index_program_university_courses_on_program_id"
  add_index "program_university_courses", ["university_course_id"], name: "index_program_university_courses_on_university_course_id"

  create_table "programs", force: true do |t|
    t.string   "degree_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "university_id"
    t.integer  "branch_id"
  end

  add_index "programs", ["branch_id"], name: "index_programs_on_branch_id"
  add_index "programs", ["university_id"], name: "index_programs_on_university_id"

  create_table "qpaper_files", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uploaded_file_file_name"
    t.string   "uploaded_file_content_type"
    t.integer  "uploaded_file_file_size"
    t.datetime "uploaded_file_updated_at"
    t.integer  "user_id"
    t.integer  "university_course_id"
  end

  add_index "qpaper_files", ["university_course_id"], name: "index_qpaper_files_on_university_course_id"
  add_index "qpaper_files", ["user_id"], name: "index_qpaper_files_on_user_id"

  create_table "qpapers", force: true do |t|
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "title"
    t.boolean  "official"
    t.integer  "university_course_id"
    t.string   "month"
    t.string   "exam_name"
    t.integer  "user_id"
  end

  add_index "qpapers", ["university_course_id"], name: "index_qpapers_on_university_course_id"
  add_index "qpapers", ["user_id"], name: "index_qpapers_on_user_id"

  create_table "questions", force: true do |t|
    t.text     "qtext"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "unit_id"
    t.integer  "course_id"
    t.integer  "topic_id"
    t.string   "qtitle"
    t.boolean  "standalone", default: false
  end

  add_index "questions", ["course_id"], name: "index_questions_on_course_id"
  add_index "questions", ["topic_id"], name: "index_questions_on_topic_id"
  add_index "questions", ["unit_id"], name: "index_questions_on_unit_id"
  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "solutions", force: true do |t|
    t.text     "answer"
    t.integer  "votes"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id"
    t.integer  "user_id"
  end

  add_index "solutions", ["question_id"], name: "index_solutions_on_question_id"
  add_index "solutions", ["user_id"], name: "index_solutions_on_user_id"

  create_table "textbooks", force: true do |t|
    t.integer  "university_course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "flipkart_banner"
    t.text     "name"
  end

  add_index "textbooks", ["university_course_id"], name: "index_textbooks_on_university_course_id"

  create_table "topics", force: true do |t|
    t.string  "name"
    t.integer "super_topic_id"
  end

  add_index "topics", ["super_topic_id"], name: "index_subtopics_on_super_topic_id"

  create_table "units", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "university_course_id"
    t.text     "unit_curriculum"
    t.integer  "unit_number"
    t.string   "name"
  end

  add_index "units", ["university_course_id"], name: "index_units_on_university_course_id"

  create_table "universities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_name"
  end

  create_table "university_courses", force: true do |t|
    t.integer  "university_id"
    t.integer  "course_id"
    t.string   "course_code"
    t.boolean  "current",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "university_courses", ["course_id"], name: "index_university_courses_on_course_id"
  add_index "university_courses", ["university_id"], name: "index_university_courses_on_university_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uname"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "university_id"
    t.integer  "program_id"
    t.integer  "institution_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["institution_id"], name: "index_users_on_institution_id"
  add_index "users", ["program_id"], name: "index_users_on_program_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["university_id"], name: "index_users_on_university_id"

end
