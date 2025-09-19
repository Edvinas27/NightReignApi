class Weapon < ApplicationRecord
  belongs_to :quality
  belongs_to :weapon_type
  has_many :weapon_attack_stats, dependent: :destroy
  has_many :weapon_guard_stats, dependent: :destroy

  accepts_nested_attributes_for :weapon_attack_stats, allow_destroy: true
  accepts_nested_attributes_for :weapon_guard_stats, allow_destroy: true

  validates :name, :level_requirement, presence: true
  validates :weapon_attack_stats, length: { is: DefaultWeaponStats::ATTACK_STAT_TYPES.size, message: "Must have exactly #{DefaultWeaponStats::ATTACK_STAT_TYPES.size} stats" }
  validates :weapon_guard_stats, length: { is: DefaultWeaponStats::GUARD_STAT_TYPES.size, message: "Must have exactly #{DefaultWeaponStats::GUARD_STAT_TYPES.size} stats" }
end
