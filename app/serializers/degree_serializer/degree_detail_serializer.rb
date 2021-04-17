module DegreeSerializer
  class DegreeDetailSerializer < ActiveModel::Serializer
    attributes :id, :name, :description
  end
end