class UsersController < ApplicationController
    def user_params
        params.require(:user).permit(:email, :password, :billing_street_address, :billing_city, :billing_state, :billing_zip_code, :first_name, :last_name, :credit_card_number, :expiration_date, :cvv, :home_street_address, :home_city, :home_state, :home_zip_code, :profile_picture, :personal_description, :house_picture, :house_description)
    end

    def new
    end
    
    def create
        @user = User.create(user_params)
        next_path = new_user_path
        if @user.errors.empty?
            next_path = login_path
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
    
    def edit
        @user = current_user
    end

    def email_exists(email)
        User.find_by(email: email)
    end

    def update
        @user = current_user
        puts "ERERRRRERERERERERER"
        puts params[:user][:profile_picture]
        profile_picture = params[:user][:profile_picture]
        File.open(Rails.root.join('app', 'assets', 'images', @user.email, 'profile_picture'), 'wb') do |file|
            file.write(profile_picture.read)
        end
        # TODO: This should probably be changed to something
        # cleaner like @user.update_attributes(user_params)
        @user.update_attribute(:email, @user.email)
        @user.update_attribute(:billing_street_address, user_params[:billing_street_address])
        @user.update_attribute(:billing_city, user_params[:billing_city])
        @user.update_attribute(:billing_state, user_params[:billing_state])
        @user.update_attribute(:billing_zip_code, user_params[:billing_zip_code])
        @user.update_attribute(:first_name, user_params[:first_name])
        @user.update_attribute(:last_name, user_params[:last_name])
        @user.update_attribute(:credit_card_number, user_params[:credit_card_number])
        @user.update_attribute(:expiration_date, user_params[:expiration_date])
        @user.update_attribute(:cvv, user_params[:cvv])
        @user.update_attribute(:home_street_address, user_params[:home_street_address])
        @user.update_attribute(:home_city, user_params[:home_city])
        @user.update_attribute(:home_state, user_params[:home_state])
        @user.update_attribute(:home_zip_code, user_params[:home_zip_code])
        @user.update_attribute(:profile_picture, user_params[:profile_picture])
        @user.update_attribute(:personal_description, user_params[:personal_description])
        @user.update_attribute(:house_picture, user_params[:house_picture])
        @user.update_attribute(:house_description, user_params[:house_description])
        @user.save!
        flash[:notice] = "Your account has been updated!"
        redirect_to root_path
        # redirect_to user_path
    end
    
    def destroy
        @user = current_user
        log_out
        @user.destroy
        flash[:notice] = "Your account has been deleted."
        redirect_to root_path
    end

    def show
        @user = current_user#User.where({username: session["username"]}).first
    end
end

