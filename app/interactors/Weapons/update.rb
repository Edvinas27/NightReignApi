module Weapons
  class Update
    include Interactor

    def call
      weapon = Weapon.find_by(id: context.id)
      raise ActiveRecord::RecordNotFound, "Weapon with id=#{context.id} not found" unless weapon
      weapon.update!(context.params)
      context.weapon = weapon
    end
  end
end
