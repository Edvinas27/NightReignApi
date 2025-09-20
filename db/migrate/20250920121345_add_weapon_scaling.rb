class AddWeaponScaling < ActiveRecord::Migration[8.0]
  def change
    add_column :weapons, :scaling, :jsonb, default: {}, null: false
    add_index :weapons, :scaling, using: :gin
  end
end
