class SongsController < ApplicationController

    get '/songs' do 
        @songs = current_user.songs
        erb :'/songs/index'
    end    
    
    get '/songs/new' do 
        erb :'/songs/new'
    end    

    post '/songs' do 
       
        @song = Song.create(params[:song])
        @song.user_id = current_user.id
        @song.save
        
        redirect to "/songs/#{@song.id}"
    end    

    get '/songs/:id' do 
        @song = Song.find_by_id(params[:id])
        erb :'/songs/show'
    end   
    
    get '/songs/:id/edit' do 
        @song = Song.find_by_id(params[:id])
        
        erb :'/songs/edit'
    end   
    
    patch '/songs/:id' do 
        @song = Song.find_by_id(params[:id])
        @song.update(params[:song])

        @song.save
       
        redirect to "/songs/#{@song.id}"

    end    
    
    delete '/songs/:id' do 
        @song = Song.find_by_id(params[:id])
        @song.delete

        redirect to '/songs'
    end    

end   