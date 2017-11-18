class UsersController < ApplicationController
    def user_params
        params.require(:user).permit(:email, :password, :first_name, :last_name, :billing_street_address, :billing_city, :billing_state, :billing_zip_code, :billing_first_name, :billing_last_name, :credit_card_number, :expiration_date, :cvv, :home_street_address, :home_city, :home_state, :home_zip_code, :personal_description, :house_description, :searchable, :price, :available_time_start, :available_time_end, :title, :capacity)
    end

    def amenity_params
        params.require(:amenity_list).permit(:wifi, :coffee, :computer_desk, :printer, :projector, :microwave, :kitchen_access, :tv_screen, :outdoor_space, :piano, :art_space, :garage)
    end

    def new
    end
    
    def create
        @user = User.create(user_params)
        @user.amenity_list = AmenityList.new
        next_path = new_user_path
        if @user.errors.empty?
            path = Rails.root.join('app', 'assets', 'images', 'user_images', @user.email)
            Dir.mkdir path unless File.exists? path
            next_path = new_user_billing_path
            log_in @user
            flash[:notice] = "#{@user.email} was successfully created."
        else
            msg = ""
            @user.errors.keys.each do |var|
                msg = msg + "#{var} #{@user.errors[var][0]}, "
            end
            flash[:notice] = msg[0..-3]
        end
        redirect_to next_path
    end
    
    def new_billing
        @user = current_user
    end
    
    def new_host
        @user = current_user
    end
    
    def edit
        @user = current_user
    end
    
    def update_billing
        @user = current_user
        update_user_fields and redirect_to new_user_host_path
    end

    def update_host
        @user = current_user
        update_user_fields and redirect_to root_path
    end

    def update
        @user = current_user
        update_user_fields and redirect_to user_path(@user)
    end
    
    def destroy
        @user = current_user
        log_out
        @user.destroy
        
        # Remove image files associated with @user
        if File.exists? Rails.root.join('app', 'assets', 'images', 'user_images', @user.email)
            FileUtils.rm_rf Rails.root.join('app', 'assets', 'images', 'user_images', @user.email)
        end
        
        flash[:notice] = "Your account has been deleted."
        redirect_to root_path
    end

    def show
        @user = User.find params[:id]
        @current_user = current_user
    end
end
