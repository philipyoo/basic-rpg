class CreateAllItems < ActiveRecord::Migration
  def change
    create_table :all_items do |t|
      t.string :name
      t.text :description
      t.integer :level_restriction
      t.integer :effect_hp
      t.integer :atk
      t.integer :def
    end
  end
end
