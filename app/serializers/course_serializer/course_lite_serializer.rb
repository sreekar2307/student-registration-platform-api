module CourseSerializer
  class CourseLiteSerializer < ActiveModel::Serializer
    attributes :id, :name
  end
end