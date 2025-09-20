class WeaponsController < ApplicationController

  def index
    result = GetWeapons.call

    if result.success?
      render json: result.weapons, status: :ok
    end
  end

  def show
    result = GetWeapon.call(id: params[:id])
    if result.success?
      render json: result.weapon, status: :ok
    else
      render json: { error: result.error }, status: :not_found
    end
  end

  def create
    result = CreateWeapon.call(params: weapon_params)

    if result.success?
      render json: result.weapon, status: :created
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  def update
    result = UpdateWeapon.call(id: params[:id], params: weapon_params)

    if result.success?
      render json: result.weapon, status: :ok
    else
      render json: { errors: result.errors || result.error }, status: :unprocessable_entity
    end
  end

  def destroy
    DestroyWeapon.call(id: params[:id])

    head :no_content
  end

  private

    def weapon_params
      params.require(:weapon).permit(
      :name,
      :weapon_type_id,
      :level_requirement,
      :quality_id,
      stats: [ { attack: DefaultWeaponStats::ATTACK_STAT_TYPES }, { guard: DefaultWeaponStats::GUARD_STAT_TYPES } ]
      )
    rescue ActionController::ParameterMissing => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
end
