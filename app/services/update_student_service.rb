class UpdateStudentService
  attr_accessor :student_params, :student

  def initialize(student, student_params)
    @student = student
    @student_params = student_params
  end

  def call
    student.courses = Course.where(id: student_params["course_ids"]) if student_params["course_ids"].present?
    student.degree = Degree.find_by(id: student_params["degree_id"]) if student_params["degree_id"].present?
    student.name = student_params.fetch("name", student.name)
    student.email = student_params.fetch("email", student.email)
    student.enrollment_no = student_params.fetch("enrollment_no", student.enrollment_no)
    student
  end
end