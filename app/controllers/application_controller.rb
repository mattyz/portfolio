class ApplicationController < ActionController::Base
  # missing from Rails gen
  # protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  # for module
  before_action :set_copyright

  def set_copyright
    @copyright = EulogizerViewTool::Renderer.copyright("Portmanteau LLC ","All Rights Reserved")
  end

#build a gem exercise
  module EulogizerViewTool
    class Renderer
      def self.copyright name, msg
        # html copyright symbol &copy;
        "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
      end
    end
  end

  # before_action :set_source

  # override current_user from devise implementation
#  def current_user
#    # create a Null Object user via OpenStruct
#    super || OpenStruct.new(name: "Guest User", first_name: "Guest", last_name: "User", email: "guest_user@here.com")
#  end
#
  # TODO: refactor
  # if params passed in add something to the view
  # add this to the session as source
  # in browser add ?q=twitter and key[:source} in session is mapped 
  # to twitter
  #def set_source
  #  session[:source] = params[:q] if params[:q]
  #end
end
