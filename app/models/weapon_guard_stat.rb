class WeaponGuardStat < ApplicationRecord
  belongs_to :weapon

  validates :stat_type, presence: true, inclusion: { in: DefaultWeaponStats::GUARD_STAT_TYPES }
  validates :value, presence: true, numericality: { greater_than_or_equal_to: 0 }
end