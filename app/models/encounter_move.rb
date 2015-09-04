class EncounterMove < ActiveRecord::Base
  belongs_to :encounter
  belongs_to :move
end
