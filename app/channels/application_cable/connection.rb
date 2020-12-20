module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # tell websocket where the current user is
    identified_by :current_user

    def connect
      self.current_user =  find_verified_user || guest_user
      logger.add_tags 'ActionCable', current_user.email
      logger.add_tags 'ActionCable', current_user.id
    end

    def guest_user
      guest = GuestUer.new
      # in memory id that s/b unique, used for actioncable exclusively
      guest.id = guest.object_id 
      guest.name = "Guest User"
      guest.first_name = "Guest"
      guest.last_name = "User"
      guest.email = "guest@user.com"
      guest
    end

    protected

    # can't tell devise in the normal way to get the user, ergo use warden
    # only works if user is signed in, so use guest user is an issue
    # create an new guest user
    def find_verified_user
      if verified_user = env['warden'].user 
        verified_user
      end
    end
  end
end
