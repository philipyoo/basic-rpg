
get '/' do
  erb :index
end

get '/login' do
  if auth_logged_in?
    redirect "/profile/#{auth_current_user.id}"
  end
  @username = ''
  erb :'users/login'
end

post '/login' do
  @username = params[:username]
  user = User.find_by_username(@username)

  if (user && user.password == params[:password])
    auth_login(user)
    redirect "/profile/#{user.id}"
  else
    @form_error = 'Unable to log you in.'
    erb :'users/login'
  end
end

get '/register' do
  if auth_logged_in?
    redirect "/profile/#{auth_current_user.id}"
  end

  @user = User.new
  erb :'users/register'
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

get '/logout' do
  auth_logout
  redirect '/login'
end

#edit account
get '/profile/:id/edit' do
  @user = auth_current_user
  erb :'users/edit'
end

put '/profile/:id' do |id|
  auth_current_user.update(params[:user])
  redirect "/profile/#{auth_current_user.id}"
end

#delete account
delete '/profile/:id' do |id|
  auth_logout
  User.find(id).destroy
  redirect '/'
end


#profile page with all characters
get '/profile/:id' do
  @all_characters = auth_current_user.characters

  erb :'users/profile'
end
