class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  
  # GET /products or /products.json
  def index
    authorize Product
    if current_user.is_admin? && current_user.has_outlet
      @products = current_user.outlet.products
    elsif current_user.is_super_admin? || current_user.is_customer?
      @products = Product.all
    else
      @products = []
    end
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    authorize Product
    @product = current_user.outlet.products.create(product_params)
    # user.avatar.attach(params[:avatar])
    # @product.image.attach(params[:image])
    # respond_to do |format|
      if @product.save
        # format.html { redirect_to @product, notice: "Product was successfully created." }
        # format.json { render :show, status: :created, location: @product }
        redirect_back fallback_location: products_url, notice: "Product was successfully created."
      else
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @product.errors, status: :unprocessable_entity }
        redirect_back fallback_location: products_url, notice: :unprocessable_entity
      end
    # end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    authorize @product
    # respond_to do |format|
      if @product.update(product_params)
        # format.html { redirect_to @product, notice: "Product was successfully updated." }
        # format.json { render :show, status: :ok, location: @product }
        redirect_to products_url, notice: "Product was successfully updated."
      else
        # format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @product.errors, status: :unprocessable_entity }
        redirect_back fallback_location: products_url, notice: :unprocessable_entity
      end
    # end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    authorize @product
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :quantity, :image)
    end
end
