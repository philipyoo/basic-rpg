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


# Route to Stage 1
get '/character/:id/map/:map_id' do
  @character = Character.find(params[:id])

  if params[:map_id] != '4'

    @monster = Encounter.all[rand(150) + 1]
    # hp = @monster.hp
    # atk = @monster.atk
    # defe = @monster.def
    # {hp: hp, atk: atk, def: defe}
    if Encounter.stage(@monster) != params[:map_id]
      @monster = Encounter.all[rand(150) + 1]
    end

    erb :'maps/stage1'
  else
    @monster = Encounter.all[rand(150..151)]
    erb :'maps/stage4'
  end
end

get '/character/:id/battle/:battle_id' do
  @character = Character.find(params[:id])
  @monster = Encounter.find(params[:battle_id])

  p @monster
  p '*' * 100
  p @character

  erb :'maps/battle'
end


#
