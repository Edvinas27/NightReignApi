class RemoveQualityStringFromWeapons < ActiveRecord::Migration[8.0]
  def change
    remove_column :weapons, :quality
  end
end
