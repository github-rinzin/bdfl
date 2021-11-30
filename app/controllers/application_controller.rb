class ApplicationController < ActionController::Base
    include Pundit
    before_action :configure_permitted_parameters, if: :devise_controller?
    def index
      authorize :account, :blocked?
    end
    def show
      authorize :account, :blocked?
    end
    def new
      authorize :account, :blocked?
    end
    def create
      authorize :account, :blocked?
    end
    def edit
      authorize :account, :blocked?
    end
    def update
      authorize :account, :blocked?
    end
    def destroy
      authorize :account, :blocked?
    end
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:cid, :phone, :name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:cid, :phone, :name])
    end

    
end
