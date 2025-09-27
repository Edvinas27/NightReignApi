module Weapons
  class Index
    include Interactor

    def call
      context.weapons = Weapon.includes(:weapon_type, :quality)
                              .order(:id)
    end
  end
end