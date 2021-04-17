class Student < ApplicationRecord
  paginates_per 15
  belongs_to :degree
  has_many :student_courses_map, class_name: 'StudentsCourses'
  has_many :courses, through: :student_courses_map, dependent: :destroy
  validates :name, presence: { message: 'Name of a student cannot be empty' }
  validates :email, presence: { message: 'Email address of a student cannot be empty' },
            uniqueness: { message: 'Email address of a student has to be unique' }
  validates :enrollment_no, presence: { message: 'Enrollment Number of a student cannot be empty' },
            uniqueness: { message: 'Enrollment Number of a student has to be unique' }
end
