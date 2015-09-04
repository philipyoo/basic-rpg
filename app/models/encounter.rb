class Encounter < ActiveRecord::Base
  has_many :moves, through: :encounter_moves
  has_many :encounter_moves

  attr_reader :hp, :atk, :def

  #test hp+atk+def
  def self.stage(stats)
    total = stats["hp"].to_i + (stats["atk"].to_i / 2) + (stats["def"].to_i / 2)

    if total < 100
      return 1
    elsif total < 150
      return 2
    else
      return 3
    end
  end

  def attack_pt
    (self.atk / 5) + self.level * (rand(10))
  end

  def defense_pt
    (self.def / 5) + self.level * (rand(10))
  end

end
