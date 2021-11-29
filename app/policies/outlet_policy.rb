class OutletPolicy < ApplicationPolicy
  attr_reader :user, :outlet

  def initialize(user, outlet)
    @user = user
    @outlet = outlet
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    @user.is_super_admin?
  end

  def new?
    create?
  end

  def update?
    if @user.is_super_admin? || @outlet.user.id == @user.id
      true
    else
      false
    end
  end

  def edit?
    update?
  end

  def destroy?
    @user.is_super_admin?
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
