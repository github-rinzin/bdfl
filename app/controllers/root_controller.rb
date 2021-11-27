class RootController < ApplicationController
    def index
    end
    def changeRole
        @user = User.find(params[:user].to_i);
        @user.role_id = params[:role].to_i
        redirect_to root_path
    end
    def deliver_product
        # send email to user
        # change the status 
    end
end
