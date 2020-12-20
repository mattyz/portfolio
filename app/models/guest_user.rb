class GuestUser < User
  # add id for warden via devise to create a new guest user
  attr_accessor :name, :first_name, :last_name, :email, :id
end
