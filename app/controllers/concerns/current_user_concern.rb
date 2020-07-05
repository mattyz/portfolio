module CurrentUserConcern
  extend ActiveSupport::Concern
  
  def current_user
    # create a Null Object user via OpenStruct
    super || create_guest_user
  end


  def create_guest_user
    OpenStruct.new(name: "Guest User",
                   first_name: "Guest",
                   last_name: "User",
                   email: "guest_user@here.com")
  end

end
