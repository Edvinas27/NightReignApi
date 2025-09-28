class Weapon < ApplicationRecord
  belongs_to :quality
  belongs_to :weapon_type

  validates :name, :level_requirement, presence: true
  validates  :level_requirement, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates_with WeaponValidator

  def attack_stats
    stats["attack"] || {}
  end
  def guard_stats
    stats["guard"] || {}
  end
  def scaling_stats
    stats["scaling"] || {}
  end
end
