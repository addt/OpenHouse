class MainController < ApplicationController
    def show
        @user = current_user
    end
    
    def search
        @address = params[:location][:address]
        @city = params[:location][:city]
        @state = params[:location][:state]
        
        @users = User.where(:searchable => true)
        if @address != ""
            @users = @users.where(:home_street_address => @address)
        end
        if @city != ""
            @users = @users.where(:home_city => @city)
        end
        if @state != ""
            @users = @users.where(:home_state => @state)
        end
        # @users = @users.sort MAKE SEARCH FUNCTION BASED OFF OF DISTANCE W/GOOGLE MAPS API

        @user = current_user
    end
end
