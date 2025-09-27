class WeaponsController < ApplicationController
  include SerializeCollection
  def index
    result = Weapons::Index.call(params: params)
      pagy, weapons = pagy(result.weapons, limit: params[:limit], page: params[:page])
      render json: { weapons: serialize_collection(weapons, WeaponSerializer),
                     pagy: pagy_metadata(pagy) }, status: :ok
  end

  def show
    result = Weapons::Show.call(id: params[:id])
    render json: result.weapon, status: :ok
  end

  def create
    result = Weapons::Create.call(params: weapon_params)
    render json: result.weapon, status: :created
  end

  def update
    result = Weapons::Update.call(id: params[:id], params: weapon_params)
    render json: result.weapon, status: :ok
  end

  def destroy
    Weapons::Destroy.call(id: params[:id])

    head :no_content
  end

  private

    def weapon_params
      params.require(:weapon).permit(
      :name,
      :weapon_type_id,
      :level_requirement,
      :quality_id,
      stats: {}
      )
    end
end
