# Helper functions relating to users

########### THIS IS BEING PHASED OUT FOR CLOUDINARY ##############
# :nocov:

module UsersHelper
  def update_picture(type)
    # Check for invalid input
    if invalid_input(type)
      redirect_to request.referrer || root_path and return true
    end
    
    image = params[:user][type]
    # Should not update images
    if image.nil?
      return false
    end
    
    # Delete previous image, only if type is :profile_picture or :house_picture
    handle_image_delete(type)
    
    # Upload the image
    upload_image(type)
    
    # Update user's attributes
    update_user_image_parameters(type)
    
    flash[:notice] = 'Your picture has been updated.'
    redirect_to request.referrer and return true
  end
  
  def invalid_input(type)
    # No image given to update
    if params[:user].nil?
      flash[:notice] = 'Please select an image first.'
      return true
    end
    
    # Wrong type of image file
    image = params[:user][type]
    if !image.nil? and !(image.content_type =~ %r{^image\/})
      flash[:notice] = 'You must choose an image file.'
      return true
    end
    
    # All good
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
  
  def upload_image(type)
    image = params[:user][type]
    # Upload image to database
    File.open(Rails.root.join('app', 'assets', 'images', 'user_images',
                              @user.email, image.original_filename), 'wb') do |file|
      file.write(image.read)
    end
  end
  
  def update_user_image_parameters(type)
    image = params[:user][type]
    # Simply update user's attribute
    if type != :more_picture
        params[:user][type] = image.original_filename
        @user.update_attribute(type, params[:user][type])
        return
    end
    
    # :more_images kept as an array, simply append this new image name into the array
    images_array = @user.house_images
    if images_array == nil
      images_array = []
    end
    images_array.push image.original_filename
    @user.update_attribute(:house_images, images_array)
  end
  
  def handle_image_delete(type)
    # Delete the user's attribute, if type isn't :more_pictures
    old_picture_name = nil
    if (type == :profile_picture)
      old_picture_name = @user.profile_picture
      @user.profile_picture = nil
    elsif (type == :house_picture)
      old_picture_name = @user.house_picture
      @user.house_picture = nil
    end
    delete_picture(old_picture_name)
  end
  
  def delete_picture(picture_name)
    # Remove picture file from database
    if picture_name and File.exists? Rails.root.join('app', 'assets', 'images', 'user_images', @user.email, picture_name)
      File.delete Rails.root.join('app', 'assets', 'images', 'user_images', @user.email, picture_name)
    end
  end
  
end

# :nocov:
########### THIS IS BEING PHASED OUT FOR CLOUDINARY ##############
