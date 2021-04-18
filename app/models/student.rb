class Student < ApplicationRecord
  paginates_per 15
  belongs_to :degree
  has_many :student_courses_map, class_name: 'StudentsCourses'
  has_many :courses, through: :student_courses_map, dependent: :destroy, before_add: :courses_enrolled
  validates :degree, presence: { message: 'Student must be assigned to a degree' }
  validates :name, presence: { message: 'Name of a student cannot be empty' }, length: { minimum: 3 }
  validates :email, presence: { message: 'Email address of a student cannot be empty' },
            uniqueness: { message: 'Email address of a student has to be unique' },
            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :enrollment_no, presence: { message: 'Enrollment Number of a student cannot be empty' },
            uniqueness: { message: 'Enrollment Number of a student has to be unique' }

  private

  def courses_enrolled(course)
    if degree.nil?
      errors.add(:wrong_enrollment, "Student should be assigned to a degree before enrolling for course")
      throw(:abort)
    end
    unless degree.courses.include?(course)
      errors.add(:wrong_enrollment, "Student cannot enroll for course not offered by a degree")
      throw(:abort)
    end
  end
end
