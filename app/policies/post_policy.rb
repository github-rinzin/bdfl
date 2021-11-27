class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    user.is_admin? ||  user.is_super_admin?
  end
  def update?
    user.is_super_admin? || user.id == post.user_id
  end
  def destroy?
    user.is_super_admin? || user.id == post.user_id
  end
end
