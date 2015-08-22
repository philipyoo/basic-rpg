class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :hp
      t.integer :xp
      t.integer :level
      t.integer :atk
      t.integer :armor

      t.timestamps
    end
  end
end
