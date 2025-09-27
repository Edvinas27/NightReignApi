FactoryBot.define do
  factory :weapon do
    name { "Claymore" }
    level_requirement { 0 }
    association :quality
    association :weapon_type
    stats do
      {
        "attack" => { "Phy" => 107, "Mag" => 0, "Fire" => 0, "Ligt" => 0, "Holy" => 0, "Crit" => 100 },
        "guard" => { "Phy" => 100, "Mag" => 35, "Fire" => 35, "Ligt" => 35, "Holy" => 35, "Boost" => 46 },
        "scaling" => { "STR" => "C", "DEX" => "C" }
      }
    end
  end
end
