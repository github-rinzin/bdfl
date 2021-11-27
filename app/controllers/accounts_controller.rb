class AccountsController < ApplicationController
    before_action :authenticate_user!
    def index
        if current_user.is_super_admin
            @users = User.all
        else
            redirect_to root_path
        end
    end
    
    def create
        if current_user.is_super_admin
            @email = params[:email]
            # AdminMailer.with(email:@email).invite_user.deliver
            redirect_to accounts_url, notice: "User invited successfully"
        else
            redirect_to root_path
        end   
    end
    def update
        if current_user.is_super_admin
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
        else
            redirect_to root_path
        end 
        
    end
end
