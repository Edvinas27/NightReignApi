class RemoveScalingJsonb < ActiveRecord::Migration[8.0]
  def change
    remove_index :weapons, :scaling, using: :gin
    remove_column :weapons, :scaling, :jsonb, default: {}, null: false
  end
end
