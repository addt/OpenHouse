class UsersController < ApplicationController
    def user_params
        params.require(:user).permit(:email, :password, :first_name, :last_name, :billing_street_address, :billing_city, :billing_state, :billing_zip_code, :billing_first_name, :billing_last_name, :credit_card_number, :expiration_date, :cvv, :home_street_address, :home_city, :home_state, :home_zip_code, :personal_description, :house_description, :searchable, :price)
    end

    def new
    end
    
    def create
        @user = User.create(user_params)
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
    
    def update_billing
        @user = current_user
        @user.update_attributes(user_params)
        @user.save!
        flash[:notice] = "#{@user.email}\'s billing information has been added."
        redirect_to new_user_host_path
    end
    
    def new_host
        @user = current_user
    end
    
    def update_host
        @user = current_user
        @user.update_attributes(user_params)
        @user.save!
        flash[:notice] = "#{@user.email}\'s hosting information has been added."
        redirect_to root_path
    end
    
    def edit
        @user = current_user
    end

    def update
        @user = current_user
        return if update_picture(:profile_picture)
        return if update_picture(:house_picture)
        @user.update_attributes(user_params)
        @user.save!
        flash[:notice] = "Your account has been updated!"
        redirect_to root_path
    end
    
    def destroy
        @user = current_user
        log_out
        @user.destroy
        flash[:notice] = "Your account has been deleted."
        redirect_to root_path
    end

    def show
        @user = User.find params[:id]
        @current_user = current_user
    end
end

