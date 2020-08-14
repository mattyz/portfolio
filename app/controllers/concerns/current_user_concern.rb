module CurrentUserConcern
  extend ActiveSupport::Concern
  
  def current_user
    # create a Null Object user via OpenStruct
    super || create_guest_user
  end


  def create_guest_user
    guest = GuestUser.new(name: "Guest User",
                   email: "guest_user@here.com")
    guest
  end

end
