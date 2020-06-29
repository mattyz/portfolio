class ApplicationController < ActionController::Base
  # missing from Rails gen
  # protect_from_forgery with: :exception
   # attempted to move to separate concern but devise fails with
  # message NoMethodError (undefined method `configure_permitted_parameters' for #<Devise::SessionsController:0x00007f89d0d22d08>
# Did you mean?  configure_permitted_parameters·)
  include DeviseWhitelist
end
