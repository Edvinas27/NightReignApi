class DestroyWeapon
  include Interactor

  def call
    weapon = Weapon.find_by(id: context.id)
    if weapon
      weapon.destroy
    end
  end
end
