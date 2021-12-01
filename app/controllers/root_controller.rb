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
        @invoice = Invoice.find(params[:id])
        @invoice.order_completed = true
        if @invoice.save
            @user = User.find(@invoice.user_id)
            InvoiceMailer.with(email: @user.email, invoice: @invoice).deliverProduct.deliver
            redirect_to invoices_path, notice: "Dilivered successfully"
        else
            redirect_to invoices_path, notice: "Failed to deliver"
        end
    end
end
