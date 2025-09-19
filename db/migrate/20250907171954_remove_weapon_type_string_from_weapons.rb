class RemoveWeaponTypeStringFromWeapons < ActiveRecord::Migration[8.0]
  def change
    remove_column :weapons, :weapon_type
  end
end
