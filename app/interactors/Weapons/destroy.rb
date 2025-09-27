module Weapons
  class Destroy
    include Interactor

    def call
      weapon = Weapon.find_by(id: context.id)
        weapon.destroy! if weapon
    end
  end
end
