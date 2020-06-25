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
            erb :'/users/login'
    end    

    post '/users/login' do
     
      user = User.find_by_username(params[:user][:username])

        if user && user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          
          redirect to '/users/:id'
        else
            erb :'/users/login'
        end
      end

      get '/users/logout' do
        session.clear
        redirect 'users/login'
      end

      get '/users/:id' do
        @user = User.find(session[:user_id])
        @songs = Song.all
        erb :'/users/show'
      end

end    