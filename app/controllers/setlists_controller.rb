class SetlistsController < ApplicationController


    get '/setlists' do 
        @setlists = current_user.setlists
        erb :'/setlists/index'
    end    

    get '/setlists/new' do 
        @songs =  current_user.songs
       
        erb :'/setlists/new'
    end    

    post '/setlists' do 
        @setlist = Setlist.create(params[:setlist])
        @setlist.user_id = current_user.id
        @setlist.save
        
        redirect to "/setlists/#{@setlist.id}"
    end    

    get '/setlists/:id' do 
        @setlist = Setlist.find_by_id(params[:id])
        @songs 
        erb :'/setlists/show'
    end   
end    
