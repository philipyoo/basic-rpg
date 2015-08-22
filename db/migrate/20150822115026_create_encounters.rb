class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.string :name
      t.integer :hp
      t.integer :xp
      t.integer :level
      t.integer :atk
      t.integer :armor

    end
  end
end
