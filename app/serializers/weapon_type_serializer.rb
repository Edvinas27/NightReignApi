class WeaponTypeSerializer < ActiveModel::Serializer
  attributes :id
  attributes :name, :category
end
