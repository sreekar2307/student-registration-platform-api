class CreateStudentsCoursesJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :students_courses do |t|
      t.belongs_to :student, foreign_key: true
      t.belongs_to :course, foreign_key: true
    end
    add_index(:students_courses, [:student_id, :course_id], unique: true)
  end
end
