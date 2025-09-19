class MakeWeaponColumnsNotNull < ActiveRecord::Migration[8.0]
  def change
    change_column_null :weapons, :name, false
    change_column_null :weapons, :weapon_type, false
    change_column_null :weapons, :level_requirement, false
    change_column_null :weapons, :quality, false
  end
end
