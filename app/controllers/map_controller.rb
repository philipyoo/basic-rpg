# GOALS:  TODO
  # 1. Create a play screen with displayed top board for player.
  # 2. Create a map screen below.
  # 3. Create a unique navbar at top for entering/exiting the "play version" of game site.
  # 4. Items inventory, Equip Gear, Use Potions, Drop Items, etc.
  # 5. Stretch: At bottom, display last actions?

# How to organize this all:  TODO
  # 1. First, plan initial routes
  # 2. Plan out a few map piece routes
  # 3. Build algorithms and logic: Consider encounter rate, item drop rate, item storage into character, randomize stats of items before storage, randomize dmg done or taken, randomize hit rate (stretch), etc...
  # 5. Build out a few map pieces and test game logic/algorithms
  # 6. Build out CSS view. Test out div placement of map pieces.
  # 7. Blahhhhh

# Tables:
### Edit Tables: Description of an item can have key word stored for use as action word in battles (Stretch)
  # Character: Name, Hp, Xp, Level, Atk, Def
  # Item: Name, Description, Level Restriction, Effect HP, Atk, Def
  # Encounter: Name, Hp, Level, Atk, Def

# IDEA:
## Navbar on left side of screen in a partial. Links:
## Character Details + Equip + Stat assignment (+ notification if unassigned points exist), Inventory, Explore/Battle, Settings (edit character information), Exit Play Mode


# Initial play route that will display "Character Details page"




get '/character/:id/play' do
  @character = Character.find(params[:id])

  erb :'maps/index'
end

# Inventory
get '/character/:id/inventory' do
  @character = Character.find(params[:id])

  @character.heal_up!
  @character.save

  erb :'maps/inventory'
end

# Rajal Pun
get '/character/:id/pun' do
  @character = Character.find(params[:id])
  erb :'maps/rajal'
end

# Select a stage route "Select Stage"
get '/character/:id/map' do
  @character = Character.find(params[:id])
  erb :'maps/select_stage'
end

# Settings/Edit Character
get '/character/:id/settings' do
  @character = Character.find(params[:id])

  erb :'maps/settings'
end

put '/character/:id' do |id|
  @character = Character.find(params[:id])
  @character.name = params[:name]

  @form_message = "Edited account information"
  erb :'maps/settings'
end


# Route to Stages depending on difficulty
get '/character/:id/map/:map_id' do
  @character = Character.find(params[:id])

  map_id = params[:map_id]

  if map_id != '4'

    @monster = Encounter.all[rand(150) + 1]

    while Encounter.stage(@monster) != map_id
      @monster = Encounter.all[rand(150) + 1]
    end

    if map_id == "1"
      erb :'maps/stage1'
    elsif map_id == "2"
      erb :'maps/stage2'
    else
      erb :'maps/stage3'
    end

  else
    @monster = Encounter.all[rand(150..151)]
    erb :'maps/stage4'
  end
end


get '/character/:id/battle/:battle_id' do
  @character = Character.find(params[:id])
  @monster = Encounter.find(params[:battle_id])


  erb :'maps/battle'
end


post '/character/:id/battle/:battle_id' do
  @character = Character.find(params[:id])
  @monster = Encounter.find(params[:battle_id])
  @message = ""
  m_atk = @monster.attack_pt
  m_def = @monster.defense_pt
  c_atk = @character.randomizer
  c_def = @character.randomizer / 2


  @character.hp -= Character.take_dmg(m_atk, c_def)
  @monster.hp -= Encounter.take_dmg(c_atk, m_def)


  @character.save
  @monster.save

  if @character.hp <= 0 && @monster.hp <= 0
    #tie
    @message = "Tie!"
    erb :'maps/battle'
  elsif @monster.hp <= 0
    #win
    @message = "You Won!"
    erb :'maps/battle'
  elsif @character.hp <= 0
    #lost
    @message = "You Lost!"
    erb :'maps/battle'
  else
    redirect "/character/#{params[:id]}/battle/#{params[:battle_id]}"
  end
end




#
