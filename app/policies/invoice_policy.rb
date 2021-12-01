class InvoicePolicy < ApplicationPolicy
  attr_reader :user, :invoice

  def initialize(user, invoice)
    @user = user
    @invoice = invoice
  end

  def index?
    user.is_blocked
  end

  def show?
    user.is_blocked
  end

  def create?
    @user.is_customer? && user.is_blocked
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
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
