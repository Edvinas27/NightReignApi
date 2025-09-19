class CreateWeaponAttackStats < ActiveRecord::Migration[8.0]
  def change
    create_table :weapon_attack_stats do |t|
      t.references :weapon, null: false, foreign_key: true
      t.string :stat_type
      t.integer :value, default: 0, null: false

      t.timestamps
    end
  end
end
