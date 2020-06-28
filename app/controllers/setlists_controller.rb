class SetlistsController < ApplicationController

    get '/setlists' do 
        check_if_user_logged_in
        @setlists = Setlist.all

        erb :'/setlists/index'
    end    

    get '/setlists/new' do 
        check_if_user_logged_in
        @songs = current_user.songs
       
        erb :'/setlists/new'
    end    

    post '/setlists' do 
        check_if_user_logged_in
        @setlist = Setlist.create(params[:setlist])
        @setlist.user_id = current_user.id
        @setlist.save
        
        redirect to "/setlists/#{@setlist.id}"
    end    

    get '/setlists/:id' do 
        set_setlist
        check_if_user_logged_in

        erb :'/setlists/show'
    end   

    get '/setlists/:id/edit' do 
        check_if_user_logged_in
        @setlist = Setlist.find_by_id(params[:id])

        if current_user == @setlist.user
            @songs = current_user.songs
            erb :'/setlists/edit'
        else 
            redirect to "/users/#{current_user.id}"
        end        
    end   

    patch '/setlists/:id' do 
        check_if_user_logged_in
        @setlist = Setlist.find_by_id(params[:id])
        

        if current_user == @setlist.user
            @setlist.update(params[:setlist])
            @setlist.save
        
            redirect to "/setlists/#{@setlist.id}"
        else   
            redirect to "/users/#{current_user.id}"
        end     
    end
    
    delete '/setlists/:id' do 
        check_if_user_logged_in
        @setlist = Setlist.find_by_id(params[:id])
        
        if current_user == @setlist.user
            @setlist.delete

            redirect to "/users/#{current_user.id}"
        else
            redirect to '/setlists'
        end        
    end    

    private

    def set_setlist
        @setlist = Setlist.find_by(id: params[:id])
        redirect to '/' if !@setlist
    end 
end    