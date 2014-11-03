
get "/" do
  erb :"index"
end

post "/sessions" do
  # binding.pry
  user = User.find_by(email: params[:user][:email])
  if user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/my_contacts"
  else
    redirect "/"
  end
end

get '/logout' do
  session.clear
  erb :"index"
end
