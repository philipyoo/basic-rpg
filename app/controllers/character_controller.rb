# single character info page
get '/profile/:user_id/character/:id' do
  #routed from list of characters on profile
  @character = Character.find(params[:id])

  erb :'characters/profile'
end

#
post '/profile/:id/' do
  #check stats (atk + armor)

  if total_stats > x
    redirect
  else
    auth_current_user.characters.create!(:name => params[:name], :hp => 80, :xp => 0, :level => 1, :atk => params[:atk], :armor => params[:armor])
  end

  erb :"profile/#{auth_current_user.id}"
end



post '/register' do
  @user = User.new
  @user.username = params[:username]
  @user.password = params[:password]

  if @user.save
    auth_login(@user)
    redirect "/profile/#{auth_current_user.id}"
  else
    @form_error = "Unable to register you."
    erb :'users/register'
  end
end
