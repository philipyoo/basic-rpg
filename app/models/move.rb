class Move < ActiveRecord::Base
  has_many :encounters, through: :encounter_moves
  has_many :encounter_moves
end
