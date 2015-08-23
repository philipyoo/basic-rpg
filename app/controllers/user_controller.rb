
get '/' do
  erb :index
end

get '/login' do
  @username = ''
  erb :'users/login'
end

post '/login' do
  @username = params[:username]
  user = User.find_by(:username => @username)

  if (user && user.password == params[:password])
    auth_login(user)
    redirect '/profile'
  else
    @form_error = 'Unable to log you in.'
    erb :'users/login'
  end
end

get '/register' do
  @user = User.new
  erb :'users/register'
end

post '/register' do
  @user = User.new
  @user.username = params[:username]
  @user.password = params[:password]

  if @user.save
    auth_login(@user)
    redirect '/profile'
  else
    @form_error = "Unable to register you."
    erb :'users/register'
  end
end

get '/logout' do
  auth_logout
  redirect '/'
end

get '/profile' do
  'nada'
end