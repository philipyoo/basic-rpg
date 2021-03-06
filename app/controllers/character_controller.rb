# single character info page
get '/profile/:user_id/character/:id' do
  #routed from list of characters on profile
  @character = Character.find(params[:id])
  @user = User.find(params[:user_id])

  @user_chars_by_id = @user.get_all_characters

  erb :'characters/profile'
end

#create character page
get '/profile/:user_id/select' do
  @user = User.find(params[:user_id])

  erb :'characters/select'
end

#EDIT THIS
#Add algorithm to check stats || javascript tools to create the algorithm and UX
post '/profile/:user_id/select' do
  @user = User.find(params[:user_id])


  # if true  #edit total_stats > x
    # redirect "/profile/#{auth_current_user.id}/character/"
  # else
  if params[:name].size < 2
    @form_error = "Character Name must be at least 2 characters long."
    erb :'characters/select'
  else
    auth_current_user.characters.create!(:name => params[:name], :hp => 80, :xp => 0, :level => 1, :atk => params[:atk], :def => params[:def], :unassigned => 0)
  # end


    redirect "/profile/#{auth_current_user.id}"
  end
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
  @user = User.find_by_id(user_id)
  @user_chars_by_id = @user.get_all_characters

  if (@user && @user.password == params[:confirm_pw])
    @character.destroy
    redirect "/profile/#{user_id}"
  else
    @form_error = "Incorrect Password."
    erb :'characters/profile'
  end
end
