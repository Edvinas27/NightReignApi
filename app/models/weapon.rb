class Weapon < ApplicationRecord
  belongs_to :quality
  belongs_to :weapon_type

  validates :name, :level_requirement, presence: true
  validate :validate_stats, :validate_scaling

  def attack_stats
    stats["attack"] || {}
  end

  def guard_stats
    stats["guard"] || {}
  end

  def scaling_stats
    stats["scaling"] || {}
  end

  private

  def validate_stats
    missing_attack = DefaultWeaponStats::ATTACK_STAT_TYPES - attack_stats.keys
    missing_guard = DefaultWeaponStats::GUARD_STAT_TYPES - guard_stats.keys
    errors.add(:stats, "missing attack stats: #{missing_attack.join(', ')}") if missing_attack.any?
    errors.add(:stats, "missing guard stats: #{missing_guard.join(', ')}") if missing_guard.any?
  end

  def validate_scaling
    if (scaling_stats).blank?
      errors.add(:scaling, "scaling stats cannot be blank")
      return
    end

    invalid_scaling = scaling_stats.keys - DefaultWeaponStats::VALID_ATTRIBUTES
    invalid_scaling_levels = scaling_stats.values - DefaultWeaponStats::VALID_SCALING_LEVELS
    errors.add(:scaling, "invalid attribute: #{invalid_scaling.join(', ')}") if invalid_scaling.any?
    errors.add(:scaling, "invalid scaling level: #{invalid_scaling_levels.join(', ')}") if invalid_scaling_levels.any?
  end
end
