class GetWeapons
  include Interactor

  def call
      context.weapons = Weapon.includes(:weapon_type, :quality).all
  end
end
