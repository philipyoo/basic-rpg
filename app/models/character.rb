class Character < ActiveRecord::Base
  has_many :items
  belongs_to :user

  validates :name, length: { minimum: 2 }

  LEVEL_TIER = [0, 0, 100, 300, 750, 2_000, 10_000]

  HP_TIER = [0, 80, 100, 120, 140, 170, 200]

  def self.take_dmg(m_atk, c_def)
    return (m_atk - (c_def))
  end

  def level_up
    while true
      if self.xp > LEVEL_TIER[self.level]
        self.level += 1
        extra_stats
      end
    end
  end

  def max_hp
    HP_TIER[self.level]
  end

  def heal_up!
    unless self.hp > HP_TIER[self.level]
      self.hp = HP_TIER[self.level]
    end
  end

  #just add this to atk/def
  def randomizer
    self.level * (rand(10))
  end


  private

  def extra_stats
    self.unassigned += 5
  end
end
