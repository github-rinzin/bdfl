class UsersController < ApplicationController
  def new
  end

  def create
    @email = params[:email]
    AdminMailer.with(email:@email).invite_user.deliver
    reder :new
  end
end
