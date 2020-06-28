require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['TOP_SECRET']
    set :show_exceptions, false
  end

  not_found do 
   status 404

   erb :error
  end  

  get "/" do
    erb :index
  end

  error ActiveRecord::RecordNotFound do
   redirect to '/'
  end  

  helpers do 
    def is_logged_in?
      !!session[:user_id]
    end
    
    def current_user
      @current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
    end  

    def check_if_user_logged_in
      if is_logged_in?
      else
        redirect to '/users/login'
      end
    end  
  end    
  
end