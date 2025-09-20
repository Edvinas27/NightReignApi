class AddStatsToWeapons < ActiveRecord::Migration[8.0]
  def change
    add_column :weapons, :stats, :jsonb, default: {}, null: false
  end
end
