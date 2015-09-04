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

  loader = Loader.new("pokemon")
  @first_mon = loader.find(1)

  @mon2 = loader.find(2)
  @mon3 = loader.find(3)
  @mon4 = loader.find(4)
  @mon5 = loader.find(5)
  @mon6 = loader.find(6)
  @mon7 = loader.find(7)
  #

  moves123 = Loader.new("move")
  @movers1 = moves123.find(402)
  @movers2 = moves123.find(388)
  @movers3 = moves123.find(235)
  @movers4 = moves123.find(230)
  @movers5 = moves123.find(76)
  #accuracy, id, name, power


  erb :'maps/index'
end

# Inventory
get '/character/:id/inventory' do
  @character = Character.find(params[:id])
  erb :'maps/inventory'
end

# Select a stage route "Select Stage"
get '/character/:id/map' do
  @character = Character.find(params[:id])
  erb :'maps/select_stage'
end

# Settings
get '/character/:id/settings' do
  @character = Character.find(params[:id])
  erb :'maps/settings'
end








#
