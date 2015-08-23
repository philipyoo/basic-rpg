class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :hp
      t.integer :xp
      t.integer :level
      t.integer :atk
      t.integer :armor

      t.timestamps

      t.references :users
    end

  end
end
