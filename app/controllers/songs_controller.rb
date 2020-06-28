class SongsController < ApplicationController

    get '/songs' do 
        check_if_user_logged_in
        @songs = Song.all

        erb :'/songs/index'
    end    
    
    get '/songs/new' do 
        check_if_user_logged_in

        erb :'/songs/new'
    end    

    post '/songs' do 
        check_if_user_logged_in
        @song = Song.create(params[:song])
        @song.user_id = current_user.id
        @song.save
        
        redirect to "/songs/#{@song.id}"
    end    

    get '/songs/:id' do 
        set_song
        check_if_user_logged_in

        erb :'/songs/show'
    end   
    
    get '/songs/:id/edit' do 
        check_if_user_logged_in
        @song = Song.find_by_id(params[:id])
        
        if current_user == @song.user
            erb :'/songs/edit'
        else
            redirect to "/users/#{current_user.id}"
        end    
    end   
    
    patch '/songs/:id' do 
        check_if_user_logged_in
        @song = Song.find_by_id(params[:id])

        if current_user == @song.user
            @song.update(params[:song])
            @song.save
            redirect to "/songs/#{@song.id}"
        else  
            redirect to "/users/#{current_user.id}"
        end     
    end    
    
    delete '/songs/:id' do 
        check_if_user_logged_in
        @song = Song.find_by_id(params[:id])
       
        if current_user == @song.user
            @song.delete
            redirect to "/users/#{current_user.id}"
        else
            redirect to '/songs'    
        end
    end  
    
    private
    def set_song
     @song = Song.find_by(id: params[:id])
     redirect to '/' if !@song
    end 
end   