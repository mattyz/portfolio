class ApplicationController < ActionController::Base
  # missing from Rails gen
  # protect_from_forgery with: :exception
   # attempted to move to separate concern but devise fails with
  # message NoMethodError (undefined method `configure_permitted_parameters' for #<Devise::SessionsController:0x00007f89d0d22d08>
# Did you mean?  configure_permitted_parameters·)
  include DeviseWhitelist

  before_action :set_source


  # TODO: refactor
  # if params passed in add something to the view
  # add this to the session as source
  # in browser add ?q=twitter and key[:source} in session is mapped 
  # to twitter
  def set_source
    session[:source] = params[:q] if params[:q]
  end
end
