class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.string :name
      t.integer :hp
      t.integer :atk
      t.integer :def
      t.integer :exp
      t.integer :speed

      t.string :image

    end
  end
end
