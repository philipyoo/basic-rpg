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
## Character Details/Edit + Equip, Items, Stats (With notification if unassigned stat points exist), Exit Play Mode


get '/character/:id/play' do
  @character = Character.find(params[:id])
  erb :'maps/index'
end

get '/character/:id/map' do
  erb :'maps/select_stage'
end







#
