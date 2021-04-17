module CourseSerializer
  class CourseDetailSerializer < ActiveModel::Serializer
    attributes :id, :name, :description
  end
end