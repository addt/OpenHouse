class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include UsersHelper
  include TimeHelper

  helper_method :google_map_static_helper

  # MAP HAS NOT YET BEEN FULLY IMPLEMENTED, SO THIS HAS BEEN COMMENTED OUT.
  
  # Takes address or coordinate pair
  # def google_map_static_helper(center)
  #   "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17"
  # end
end
