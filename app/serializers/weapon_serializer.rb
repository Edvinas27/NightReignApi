class WeaponSerializer < ActiveModel::Serializer
  attributes :id, :name, :level_requirement, :stats
  has_one :weapon_type
  has_one :quality
end
