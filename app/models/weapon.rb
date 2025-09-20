class Weapon < ApplicationRecord
  belongs_to :quality
  belongs_to :weapon_type

  validates :name, :level_requirement, presence: true
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
