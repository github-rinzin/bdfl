class AccountPolicy <   Struct.new(:user, :account) 
  def index?
    user.is_super_admin?
  end
  def create?
    user.is_super_admin?
  end
  def update?
    user.is_super_admin?
  end
end
