class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 
self.allow_forgery_protection = false

 add_flash_types :error, :sussces
  protect_from_forgery with: :exception
end
