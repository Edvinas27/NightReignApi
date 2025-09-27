module Weapons
  class Show
    include Interactor

    def call
      weapon = Weapon.includes(:weapon_type, :quality)
                     .find_by(id: context.id)
      raise ActiveRecord::RecordNotFound, "Weapon with id=#{context.id} not found" unless weapon
      context.weapon = weapon
    end
  end
end
