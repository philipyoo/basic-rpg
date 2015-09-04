# require 'bcrypt'
# # create admin user
#
# temp_pass = BCrypt::Password.create('admin')
# admin = User.find_or_create_by!(:username => 'admin', :password_hash => temp_pass)
#
#
# # create test characters
#
# admin.characters.find_or_create_by!(:name => 'Ace', :hp => 100, :xp => 0, :level => 2, :atk => 10, :def => 10)
# admin.characters.find_or_create_by!(:name => 'Bay', :hp => 80, :xp => 0, :level => 1, :atk => 6, :def => 12)
#
# # create all items
#
# AllItem.create(:name => 'Basic Sword', :description => 'cool', :level_restriction => 0, :atk => 5)
# AllItem.create(:name => 'Basic HP Potion', :description => 'heal', :level_restriction => 0, :effect_hp => 40)
# AllItem.create(:name => 'Basic Shield', :description => 'defense!', :level_restriction => 2, :def => 5)

# # create all monsters
#
# Encounter.create(:name => 'Goblin', :hp => 20, :level => 1, :atk => 3, :def => 1)
# Encounter.create(:name => 'Orc', :hp => 30, :level => 2, :atk => 4, :def => 3)
# Encounter.create(:name => 'Orc King', :hp => 80, :level => 3, :atk => 10, :def => 10)


########

loader = Loader.new('pokemon')
x = 1

while x < 151
  pokemon = loader.find(x)

  Encounter.create(:name => pokemon["name"], :hp => pokemon["hp"], :atk => pokemon["attack"], :def => pokemon["defense"], :exp => pokemon["exp"], :speed => pokemon["speed"])

  moves = pokemon["moves"].select{ |move| move["learn_type"] == "level up" }

  mload = Loader.new('move')

  moves.each do |move|
    pokemon_move = mload.find(move["resource_uri"][7..-1].match(/\d+/)[0].to_i)

    p pokemon_move
    p "*" * 100
    p pokemon_move.is_a?(Integer)



    Encounter.last.encounter_moves << Move.create(:name => pokemon_move["name"], :power => pokemon_move["power"])

    # Encounter.last.encounter_moves.create(:move_id => Move.last.id)
  end

  x += 1
end
