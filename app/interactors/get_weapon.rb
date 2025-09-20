class GetWeapon
  include Interactor

  def call
    weapon = Weapon.includes(:weapon_type, :quality)
                   .find_by(id: context.id)
    if weapon
      context.weapon = weapon
    else
      context.fail!(error: "Weapon not found")
    end
  end
end
