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

ActiveRecord::Schema.define(version: 20151028165513) do

  create_table "admin_users", force: true do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 25
    t.string   "username",        limit: 25
    t.string   "email",                      default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  add_index "admin_users", ["username"], name: "index_admin_users_on_username", using: :btree

  create_table "block_lists", force: true do |t|
    t.string   "block_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classrooms", force: true do |t|
    t.string   "classroom_name", limit: 20
    t.integer  "position"
    t.string   "session",        limit: 20
    t.boolean  "visible",                   default: false
    t.string   "section",        limit: 20
    t.integer  "school_id"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "classrooms", ["classroom_name"], name: "index_classrooms_on_classroom_name", using: :btree

  create_table "district_lists", force: true do |t|
    t.string   "district_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exam_results", force: true do |t|
    t.integer  "student_id"
    t.integer  "subject_id"
    t.integer  "classroom_id"
    t.integer  "exam_type_id"
    t.string   "marks",        limit: 10
    t.string   "grade",        limit: 10
    t.boolean  "visible",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "exam_types", force: true do |t|
    t.string   "exam_name",  limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parents", force: true do |t|
    t.string   "parent_name",    limit: 100
    t.integer  "position"
    t.boolean  "visible",                    default: false
    t.string   "parent_address"
    t.string   "parent_mobile",  limit: 12
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "parents", ["parent_name"], name: "index_parents_on_parent_name", using: :btree

  create_table "schools", force: true do |t|
    t.string   "school_name",    limit: 100
    t.integer  "position"
    t.boolean  "visible",                    default: false
    t.string   "address_line_1", limit: 50
    t.integer  "PIN",            limit: 8
    t.string   "school_code",    limit: 50
    t.string   "district",       limit: 50
    t.string   "block",          limit: 50
    t.string   "cluster",        limit: 50
    t.integer  "admin_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schools", ["school_name"], name: "index_schools_on_school_name", using: :btree

  create_table "students", force: true do |t|
    t.string   "student_first_name", limit: 25
    t.string   "student_last_name",  limit: 25
    t.integer  "position"
    t.boolean  "visible",                       default: false
    t.string   "father_name",        limit: 50
    t.string   "mother_name",        limit: 50
    t.integer  "school_id"
    t.integer  "parent_id"
    t.integer  "classroom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "dob"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "students", ["student_first_name"], name: "index_students_on_student_first_name", using: :btree

  create_table "subjects", force: true do |t|
    t.string   "subject_name", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.string   "teacher_name",  limit: 50
    t.integer  "position"
    t.boolean  "visible",                  default: false
    t.string   "email",                    default: "",    null: false
    t.string   "teacher_phone", limit: 12
    t.string   "address"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "dob"
  end

  add_index "teachers", ["teacher_name"], name: "index_teachers_on_teacher_name", using: :btree

end
