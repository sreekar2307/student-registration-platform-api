module StudentSerializer
  class StudentLiteSerializer < ActiveModel::Serializer
    attributes :id, :email, :enrollment_no, :name
    has_many :courses, serializer: CourseSerializer::CourseLiteSerializer
    belongs_to :degree, serializer: DegreeSerializer::DegreeLiteSerializer
  end
end