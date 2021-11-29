class AuthorizationPolicy < Struct.new(:user, :authorization)
  def bdfl_admin?
    user.is_super_admin?
  end
  def outlet_admin?
    user.is_admin?
  end
  def is_customer?
    user.is_customer?
  end
end
