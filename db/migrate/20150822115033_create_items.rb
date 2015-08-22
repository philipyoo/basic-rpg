class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :level_restriction
      t.integer :effect_hp

      t.references :users
    end
  end
end
