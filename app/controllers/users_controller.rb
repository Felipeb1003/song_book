class UsersController < ApplicationController

  get '/users/signup' do 
    erb :'/users/new'
  end  

  post '/users/signup' do 
    user = User.new(params[:user])

    if user.save
      session[:user_id] = user.id 

      redirect to '/users/login'
    else
      @error = user.errors.full_messages.join("  -  ")

      erb :'users/new'
    end
  end    
        
  get '/users/login' do 
    if !is_logged_in?
      erb :'/users/login'
    else    
      redirect "/users/#{current_user.id}"
    end    
  end    

  post '/users/login' do
    user = User.find_by_username(params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      
      redirect "/users/#{current_user.id}"
    else
      @error = "Invalid Username or Password..."
      
      erb :'/users/login'
    end
  end
      
  get '/users/logout' do
    session.clear
    redirect to '/users/login'
  end

  get '/users/:id' do 
    set_user
    check_if_user_logged_in
    @songs = current_user.songs
    @setlists = current_user.setlist

    erb :'/users/show'
  end

  private
   def set_user
    @user = User.find_by(id: params[:id])
    
    redirect to '/' if !@user 
   end 
end    