FactoryBot.define do
  factory :weapon do
    name { "Claymore" }
    level_requirement { 0 }
    association :quality
    association :weapon_type
    stats { DefaultWeaponStats::DEFAULT_TEST_WEAPON_STAT_VALUES }
  end
end
