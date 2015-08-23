# single character info page
get '/profile/:user_id/character/:id' do
  #routed from list of characters on profile
  @character = Character.find(params[:id])

  erb :'characters/profile'
end

#
post '/profile/:user_id/character/:id' do
end