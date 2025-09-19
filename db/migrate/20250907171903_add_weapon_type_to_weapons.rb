class AddWeaponTypeToWeapons < ActiveRecord::Migration[8.0]
  def change
    add_reference :weapons, :weapon_type, null: false, foreign_key: true
  end
end
