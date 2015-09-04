class Encounter < ActiveRecord::Base
  has_many :moves, through: :encounter_moves
  has_many :encounter_moves
end
