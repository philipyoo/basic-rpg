class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :hp
      t.integer :xp
      t.integer :level
      t.integer :atk
      t.integer :def
      t.integer :unassigned

      t.timestamps

      t.references :user
    end

  end
end
