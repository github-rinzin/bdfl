class OutletsController < ApplicationController
  before_action :set_outlet, only: %i[ show edit update destroy ]

  # GET /outlets or /outlets.json
  def index
    @outlets = Outlet.all
  end

  # GET /outlets/1 or /outlets/1.json
  def show
  end

  # GET /outlets/new
  def new
    @outlet = Outlet.new
  end

  # GET /outlets/1/edit
  def edit
  end

  # POST /outlets or /outlets.json
  def create
    @outlet = Outlet.new(outlet_params)
    
    # # get user id for request
    # @id = params[:user_id]
    # # find user with above id
    # @user = User.find(@id)
    # # change has outlet
    # @user.has_outlet = !$user.has_outlet

    respond_to do |format|
      # if !$user.has_outlet
        if @outlet.save
          id = @outlet.user_id
          # find user with above id
          @user = User.find(id)
          # change has outlet
          @user.has_outlet = true

          @user.save();

          format.html { redirect_to accounts_path, notice: "Outlet was successfully created." }
          format.json { render :show, status: :created, location: @outlet }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @outlet.errors, status: :unprocessable_entity }
        end
      # else 
      #     format.html { render :new, status: :unprocessable_entity }
      #     format.json { render json: @outlet.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /outlets/1 or /outlets/1.json
  def update
    respond_to do |format|
      if @outlet.update(outlet_params)
        format.html { redirect_to @outlet, notice: "Outlet was successfully updated." }
        format.json { render :show, status: :ok, location: @outlet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @outlet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outlets/1 or /outlets/1.json
  def destroy
    @user = User.find(@outlet.user_id)
    @user.has_outlet = false
    @user.save()
    @outlet.destroy
    respond_to do |format|
      format.html { redirect_to outlets_url, notice: "Outlet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outlet
      @outlet = Outlet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def outlet_params
      params.require(:outlet).permit(:name, :location, :user_id)
    end
    def user_id_params
      params.require(:outlet).permit(:user_id)
    end
end
