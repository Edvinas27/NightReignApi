# frozen_string_literal: true

class WeaponValidator < ActiveModel::Validator
  def validate(record)
    validate_stats(record)
    validate_scaling(record)
  end
  private
  def validate_stats(record)
    attack_stats = record.attack_stats
    guard_stats = record.guard_stats
    missing_attack = DefaultWeaponStats::ATTACK_STAT_TYPES - attack_stats.keys
    missing_guard = DefaultWeaponStats::GUARD_STAT_TYPES - guard_stats.keys
    record.errors.add(:stats, "-> missing attack stats: #{missing_attack.join(', ')}") if missing_attack.any?
    record.errors.add(:stats, "-> missing guard stats: #{missing_guard.join(', ')}") if missing_guard.any?
  end
  def validate_scaling(record)
    scaling = record.scaling_stats
    unless scaling.present?
      record.errors.add(:stats, "-> scaling must be present")
      return
    end
    invalid_scaling = scaling.keys - DefaultWeaponStats::VALID_ATTRIBUTES
    invalid_scaling_levels = scaling.values - DefaultWeaponStats::VALID_SCALING_LEVELS
    record.errors.add(:scaling, "-> invalid attribute: #{invalid_scaling.join(', ')}") if invalid_scaling.any?
    record.errors.add(:scaling, "-> invalid level: #{invalid_scaling_levels.join(', ')}") if invalid_scaling_levels.any?
  end
end
