class MainController < ApplicationController
    def show
        @user = current_user
    end
    
    def search
        @query = params[:location][:search]
        
        @users = User.where(:searchable => true)
        
        # Exact find in users, might want to change to sort
        # if @address != ""
        #     @users = @users.where(:home_street_address => @address)
        # end
        # if @city != ""
        #     @users = @users.where(:home_city => @city)
        # end
        # if @state != ""
        #     @users = @users.where(:home_state => @state)
        # end
        
        # Ignore the input, just go to Oakland; for now.
        @full_location = "Oakland, CA"
        
        # @users = @users.sort MAKE SEARCH FUNCTION BASED OFF OF DISTANCE W/GOOGLE MAPS API
        # Attempt to generate coordinates from the given search location
        
        # # COMMENTED OUT FOR NOW ##################
        # if @full_location == "  "  # 2 spaces intentional, a regex may eventually be preferred
        #     @full_location = "Oakland, CA"
        # end
        # # COMMENTED OUT FOR NOW ##################
        
        result = Geocoder.search(@full_location)[0]
        if result != nil
            @curr_loc_lat = result.geometry['location']['lat']
            @curr_loc_lng = result.geometry['location']['lng']
        # # COMMENTED OUT FOR NOW ##################
        # else
        #     @curr_loc_lat = ""
        #     @curr_loc_lng = ""
        # # COMMENTED OUT FOR NOW ##################
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
    
    def us
        @user = current_user
    end
    def about
        @user = current_user
    end
end
