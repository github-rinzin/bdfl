class AccountPolicy <   Struct.new(:user, :account) 
  def index
    user.is_super_admin?
  end
end
