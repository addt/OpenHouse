# Helper functions relating to users
module UsersHelper
  def update_picture(type)
    if params[:user].nil?
      flash[:notice] = 'Please select an image first.'
      redirect_to request.referrer || root_path and return true
    end
    image = params[:user][type]
    unless image.nil?
      unless image.content_type =~ %r{^image\/}
        flash[:notice] = 'You must choose an image file.'
        redirect_to request.referrer || root_path and return true
      end
      
      delete_picture(type)
      
      File.open(Rails.root.join('app', 'assets', 'images', 'user_images',
                                @user.email, image.original_filename), 'wb') do |file|
        file.write(image.read)
        if type != :more_picture
          params[:user][type] = image.original_filename
          @user.update_attribute(type, params[:user][type])
        else
          images_array = @user.house_images
          if images_array == nil
            images_array = []
          end
          images_array.push image.original_filename
          @user.update_attribute(:house_images, images_array)
        end
      end
      flash[:notice] = 'Your picture has been updated.'
      redirect_to request.referrer and return true
    end
    false
  end

  def update_user_fields
    return if update_picture(:profile_picture)
    return if update_picture(:house_picture)
    return if update_picture(:more_picture)
    unless params[:amenity_list].nil?
        @user.amenity_list.update_attributes(amenity_params)
        @user.amenity_list.save!
    end
    @user.update_attributes(user_params)
    @user.save!
    flash[:notice] = "Your account has been updated."
  end
  
  # Dependent on being called only by :profile_picture and :house_picture
  def delete_picture(type)
    old_picture_name = nil
    if (type == :profile_picture)
      old_picture_name = @user.profile_picture
      @user.profile_picture = nil
    elsif (type == :house_picture)
      old_picture_name = @user.house_picture
      @user.house_picture = nil
    end
    
    if old_picture_name and File.exists? Rails.root.join('app', 'assets', 'images', 'user_images', @user.email, old_picture_name)
      File.delete Rails.root.join('app', 'assets', 'images', 'user_images', @user.email, old_picture_name)
    end
  end
  
end
