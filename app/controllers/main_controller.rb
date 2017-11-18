class MainController < ApplicationController
    def show
        @user = current_user
    end
    
    def search
        @address = params[:location][:address]
        @city = params[:location][:city]
        @state = params[:location][:state]
        
        @full_location = @address + " " + @city + " " + @state
        
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
        # Attempt to generate coordinates from the given search location
        if @full_location != "  "  # 2 spaces intentional, a regex may eventually be preferred
            result = Geocoder.search(@full_location)[0]
            if result != nil
                @curr_loc_lat = result.geometry['location']['lat']
                @curr_loc_lng = result.geometry['location']['lng']
            else
                @curr_loc_lat = ""
                @curr_loc_lng = ""
            end
        else
            @curr_loc_lat = ""
            @curr_loc_lng = ""
        end

        #Populate array of nearby homes to populate the map
        @nearby_locations = []
        User.near(@full_location).each do |location|
            @nearby_locations.push([location.latitude, location.longitude])
        end
        #puts(User.near(@full_location)[0].home_street_address)
        #puts(@nearby_locations)
        print(@nearby_locations.to_json)

        @user = current_user
    end
end
