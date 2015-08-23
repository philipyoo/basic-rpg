# home or landing page
get '/' do
  erb :index
end

get '/login' do
  @login = ''
  erb :'users/login'
end

post '/login' do
  @login = params[:login]
  user = User.find_by(:login => @login)

  if (user && user.password == params[:password])
    auth_login(user)
    flash[:message] = 'You are logged in.'
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
  @user.login = params[:login]
  @user.password = params[:password]

  if @user.save
    auth_login(@user)
    flash[:message] = "Thank you for registering."
    redirect '/profile'
  else
    @form_error = "Unable to register you."
    erb :'users/register'
  end
end

get '/logout' do
  auth_logout
  flash[:message] = "You have been logged out."
  redirect '/'
end

