class GetWeapons
  include Interactor

  def call
      context.weapons = Weapon.includes(:weapon_type, :quality)
                              .order(:id)
                              .limit(context.params[:limit])
                              .offset(context.params[:offset])
  end
end
