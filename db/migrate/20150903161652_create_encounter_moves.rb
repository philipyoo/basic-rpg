class CreateEncounterMoves < ActiveRecord::Migration
  def change
    create_table :encounter_moves do |t|
      t.references :encounter
      t.references :move
    end
  end
end
