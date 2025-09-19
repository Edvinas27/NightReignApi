class WeaponSerializer < ActiveModel::Serializer
  attributes :id
  attributes :name, :level_requirement
  attributes :attack_stats, :guard_stats
  has_one :weapon_type
  has_one :quality

  def attack_stats
    weapon_stats_hash(object.weapon_attack_stats)
  end

  def guard_stats
    weapon_stats_hash(object.weapon_guard_stats)
  end

  private

  def weapon_stats_hash(stats_collection)
    stats_collection.each_with_object({}) do |stat, hash|
      hash[stat.stat_type] = stat.value
    end
  end

end
