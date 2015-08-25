# single character info page
get '/profile/:user_id/character/:id' do
  #routed from list of characters on profile
  @character = Character.find(params[:id])

  erb :'characters/profile'
end

#create character page
get '/profile/:user_id/select' do
  erb :'characters/select'
end

#EDIT THIS
#Add algorithm to check stats || javascript tools to create the algorithm and UX
post '/profile/:user_id/select' do
  #check stats (atk + def)
  p '*' * 100

  p auth_current_user
  p auth_current_user.characters

  # if true  #edit total_stats > x
    # redirect "/profile/#{auth_current_user.id}/character/"
  # else
    auth_current_user.characters.create!(:name => params[:name], :hp => 80, :xp => 0, :level => 1, :atk => params[:atk], :def => params[:def])
  # end

  redirect "/profile/#{auth_current_user.id}"
end


#implement later ##Maybe in-game
#### Change name
#### Change gear??
#### code below copied from user_controller
# #edit character
# get '/profile/:id/edit' do
#   erb :'users/edit'
# end
#
# put '/profile/:id' do |id|
#   auth_current_user.update(params[:user])
#   redirect "/profile/#{auth_current_user.id}"
# end

#delete character
delete '/profile/:user_id/character/:id' do |user_id, id|
  @character = Character.find_by_id(id)
  user = User.find_by_id(user_id)

  if (user && user.password == params[:confirm_pw])
    @character.destroy
    redirect "/profile/#{user_id}"
  else
    @form_error = "Incorrect Password."
    erb :'characters/profile'
  end
end
