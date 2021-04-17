module DegreeSerializer
  class DegreeLiteSerializer < ActiveModel::Serializer
    attributes :id, :name
  end
end