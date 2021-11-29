class RootController < ApplicationController
    def index
    end
    def changeRole
        @user = User.find(params[:user].to_i)
        @role = Role.find(params[:role].to_i)
        @user.role_id = @role.id
        if @user.present? && @role.present? && @user.save
            redirect_to accounts_path, notice: "Role updated Succeded!"
        else
            redirect_to accounts_path, notice: "Role updated failed!"
        end
    end
    def deliver_product
        # send email to user
        # change the status 
    end
end
