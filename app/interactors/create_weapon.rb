class CreateWeapon
  include Interactor

  def call
    weapon = Weapon.new(context.params)
    if weapon.save
      context.weapon = weapon
    else
      context.fail!(errors: weapon.errors.full_messages)
    end
  end
end
