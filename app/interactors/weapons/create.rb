module Weapons
  class Create
    include Interactor

    def call
      weapon = Weapon.create!(context.params)
      context.weapon = weapon
    end
  end
end
