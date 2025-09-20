class WeaponSerializer < ActiveModel::Serializer
  attributes :id
  attributes :name, :level_requirement
  attributes :stats
  has_one :weapon_type
  has_one :quality

end
