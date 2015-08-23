
# create admin user

admin = User.create!(:username => 'admin', :password_hash => 'admin')


# create test characters

admin.characters.find_or_create_by!(:name => 'Ace', :hp => 100, :xp => 0, :level => 2, :atk => 10, :armor => 10)
admin.characters.find_or_create_by!(:name => 'Bay', :hp => 80, :xp => 0, :level => 1, :atk => 6, :armor => 12)

# create all items

AllItem.create(:name => 'Basic Sword', :description => 'cool', :level_restriction => 0, :atk => 5)
AllItem.create(:name => 'Basic HP Potion', :description => 'heal', :level_restriction => 0, :effect_hp => 40)
AllItem.create(:name => 'Basic Shield', :description => 'defense!', :level_restriction => 2)

# create all monsters

Encounter.create(:name => 'Goblin', :hp => 20, :level => 1, :atk => 3, :armor => 1)
Encounter.create(:name => 'Orc', :hp => 30, :level => 2, :atk => 4, :armor => 3)
Encounter.create(:name => 'Orc King', :hp => 80, :level => 3, :atk => 10, :armor => 10)







