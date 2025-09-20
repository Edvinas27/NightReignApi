class GetAllWeaponsJob < ApplicationJob
  queue_as :default

  def perform
    result = GetWeapons.call
    if result.success?
      Rails.cache.write("all_weapons", result.weapons.as_json(
        only: [:id, :name, :level_requirement],
        include: {
          weapon_type: { only: [:id, :name] },
          quality: { only: [:id, :name] },
        },
        methods: [:stats]
      ), expires_in: 5.minutes)
      Rails.logger.info "Cached #{result.weapons.size} weapons."
    else
      Rails.logger.error "Failed to fetch weapons: #{result.error}"
    end
  end
end
