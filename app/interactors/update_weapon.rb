class UpdateWeapon
  include Interactor

  def call
    weapon = Weapon.find_by(id: context.id)
    return context.fail!(error: "Weapon not found") unless weapon
    if weapon.update(context.params)
      context.weapon = weapon
    else
      context.fail!(errors: weapon.errors.full_messages)
    end
  end
end
