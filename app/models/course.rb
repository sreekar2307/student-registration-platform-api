class Course < ApplicationRecord
  has_many :course_students_map, class_name: 'StudentsCourses'
  has_many :students, through: :course_students_map
  belongs_to :degree
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
end
