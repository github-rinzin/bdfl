class ProductPolicy < ApplicationPolicy
  attr_reader :user, :product

  def initialize(user, product)
    @user = user
    @product = product
  end

  def index?
    !user.is_blocked 
  end

  def show?
    user.is_super_admin? || user.id == product.outlet.user_id && !user.is_blocked 
  end

  def create?
    user.is_admin? || user.is_super_admin? && user.has_outlet && !user.is_blocked
  end

  def new?
    false
  end

  def update?
    user.is_super_admin? || user.id == product.outlet.user_id && !user.is_blocked
  end

  def edit?
    # user.is_super_admin? || user.id == product.user_id
    true
  end

  def destroy?
    user.is_super_admin? || user.id == product.user_id
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
