# frozen_string_literal: true

class DefaultWeaponStats
  ATTACK_STAT_TYPES = %w[Phy Mag Fire Ligt Holy Crit].freeze
  GUARD_STAT_TYPES = %w[Phy Mag Fire Ligt Holy Boost].freeze
  VALID_ATTRIBUTES = %w[STR DEX INT FAI ARC].freeze
  VALID_SCALING_LEVELS = %w[S A B C D E].freeze

  DEFAULT_TEST_WEAPON_STAT_VALUES = {
    "attack" => { "Phy" => 107, "Mag" => 0, "Fire" => 0, "Ligt" => 0, "Holy" => 0, "Crit" => 100 },
    "guard" => { "Phy" => 100, "Mag" => 35, "Fire" => 35, "Ligt" => 35, "Holy" => 35, "Boost" => 46 },
    "scaling" => { "STR" => "C", "DEX" => "C" }
  }.freeze
end
