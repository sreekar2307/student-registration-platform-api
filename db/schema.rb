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

ActiveRecord::Schema.define(version: 2021_04_17_072745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "degree_id", null: false
    t.index ["degree_id"], name: "index_courses_on_degree_id"
  end

  create_table "degrees", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "enrollment_no", null: false
    t.string "email", null: false
    t.string "name", null: false
    t.bigint "degree_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["degree_id"], name: "index_students_on_degree_id"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["enrollment_no"], name: "index_students_on_enrollment_no", unique: true
  end

  create_table "students_courses", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "course_id"
    t.index ["course_id"], name: "index_students_courses_on_course_id"
    t.index ["student_id", "course_id"], name: "index_students_courses_on_student_id_and_course_id", unique: true
    t.index ["student_id"], name: "index_students_courses_on_student_id"
  end

  add_foreign_key "courses", "degrees"
  add_foreign_key "students", "degrees"
  add_foreign_key "students_courses", "courses"
  add_foreign_key "students_courses", "students"
end
