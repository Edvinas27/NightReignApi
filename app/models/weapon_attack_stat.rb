class WeaponAttackStat < ApplicationRecord
  belongs_to :weapon

  validates :stat_type, presence: true, inclusion: { in: DefaultWeaponStats::ATTACK_STAT_TYPES }
  validates :value, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
