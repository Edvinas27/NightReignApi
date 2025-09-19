class QualitySerializer < ActiveModel::Serializer
  attributes :id
  attributes :name, :description
end
