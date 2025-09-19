class CreateWeaponGuardStats < ActiveRecord::Migration[8.0]
  def change
    create_table :weapon_guard_stats do |t|
      t.references :weapon, null: false, foreign_key: true
      t.string :stat_type
      t.integer :value

      t.timestamps
    end
  end
end
