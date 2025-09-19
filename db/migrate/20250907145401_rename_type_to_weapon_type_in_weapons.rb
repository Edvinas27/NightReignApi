class RenameTypeToWeaponTypeInWeapons < ActiveRecord::Migration[8.0]
  def change
    rename_column :weapons, :type, :weapon_type
  end
end
