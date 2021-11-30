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
    if user.is_super_admin? || user.has_outlet && user.is_admin? && !user.is_blocked
      true
    else
      false
    end
  end

  def new?
    false
  end

  def update?
    user.is_super_admin? || user.id == product.outlet.user_id
  end

  def edit?
    update?
  end

  def destroy?
    update?
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
