class AccountsController < ApplicationController
    before_action :authenticate_user!
    def index
        @users = User.all
    end
      
    def create
        @email = params[:email]
        # AdminMailer.with(email:@email).invite_user.deliver
        redirect_to accounts_url, notice: "User invited successfully"
    end
    def update
        @user = User.find(params[:id])
        @user.toggleBlock
        state = !@user.is_blocked ? "blocked" : "unblocked";
        if @user.save
            flash[:success] = "Object was successfully updated"
            redirect_to accounts_url, notice: "User was successfully " + state
        else
            flash[:error] = "Something went wrong"
            redirect_to accounts_url
        end
    end
end
