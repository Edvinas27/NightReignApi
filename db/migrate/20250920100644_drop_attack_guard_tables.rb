class DropAttackGuardTables < ActiveRecord::Migration[8.0]
  def change
    drop_table :weapon_attack_stats
    drop_table :weapon_guard_stats
  end
end
