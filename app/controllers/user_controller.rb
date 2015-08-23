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