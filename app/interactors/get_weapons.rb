class GetWeapons
  include Interactor

  def call
    context.weapons = Weapon.all
  end
end
