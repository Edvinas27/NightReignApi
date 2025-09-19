class CreateWeapons < ActiveRecord::Migration[8.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.string :weapon_type
      t.integer :level_requirement
      t.string :quality

      t.timestamps
    end
  end
end
