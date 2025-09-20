# frozen_string_literal: true

class WeaponValidator < ActiveModel::Validator
  def validate(record)
    validate_stats(record)
    validate_scaling(record)
  end
  private
  def validate_stats(record)
    attack = record.attack_stats
    guard = record.guard_stats
    missing_attack = DefaultWeaponStats::ATTACK_STAT_TYPES - attack.keys
    missing_guard = DefaultWeaponStats::GUARD_STAT_TYPES - guard.keys
    record.errors.add(:stats, "missing attack stats: #{missing_attack.join(', ')}") if missing_attack.any?
    record.errors.add(:stats, "missing guard stats: #{missing_guard.join(', ')}") if missing_guard.any?
  end
  def validate_scaling(record)
    scaling = record.scaling_stats
    if (scaling).blank?
      record.errors.add(:scaling, "scaling stats cannot be blank")
      return
    end
    invalid_scaling = scaling.keys - DefaultWeaponStats::VALID_ATTRIBUTES
    invalid_scaling_levels = scaling.values - DefaultWeaponStats::VALID_SCALING_LEVELS
    record.errors.add(:scaling, "invalid attribute: #{invalid_scaling.join(', ')}") if invalid_scaling.any?
    record.errors.add(:scaling, "invalid scaling level: #{invalid_scaling_levels.join(', ')}") if invalid_scaling_levels.any?
  end
end
