module StudentSerializer
  class StudentDetailSerializer < ActiveModel::Serializer
    attributes :id, :email, :enrollment_no, :name, :created_at, :updated_at
    has_many :courses, serializer: CourseSerializer::CourseDetailSerializer
    belongs_to :degree, serializer: DegreeSerializer::DegreeDetailSerializer
  end
end