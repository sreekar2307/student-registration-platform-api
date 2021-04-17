class CreateStudentService
  attr_accessor :student_params

  def initialize(student_params)
    @student_params = student_params
  end

  def call
    course_ids = student_params.fetch("course_ids", [])
    degree_id = student_params.fetch("degree_id", nil)
    name = student_params.fetch("name", nil)
    email = student_params.fetch("email", nil)
    enrollment_no = student_params.fetch("enrollment_no", nil)
    student = Student.new(name: name, email: email, enrollment_no: enrollment_no, degree_id: degree_id)
    student.courses << Course.where(id: course_ids)
    student
  end
end