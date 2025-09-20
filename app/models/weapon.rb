class Weapon < ApplicationRecord
  belongs_to :quality
  belongs_to :weapon_type

  validates :name, :level_requirement, presence: true
  validate :validate_stats

  def attack_stats
    stats["attack"] || {}
  end

  def guard_stats
    stats["guard"] || {}
  end

  private

  def validate_stats
    missing_attack = DefaultWeaponStats::ATTACK_STAT_TYPES - attack_stats.keys
    missing_guard = DefaultWeaponStats::GUARD_STAT_TYPES - guard_stats.keys

    errors.add(:stats, "missing attack stats: #{missing_attack.join(', ')}") if missing_attack.any?
    errors.add(:stats, "missing guard stats: #{missing_guard.join(', ')}") if missing_guard.any?
  end
end
