class InvoicesController < ApplicationController
  # before_action :set_invoice, only: %i[ show edit update destroy ]

  # GET /invoices or /invoices.json
  def index
    authorize Invoice
    if current_user.is_super_admin?
      @invoices = Invoice.where(order_completed: false)
    elsif current_user.is_admin?
      if current_user.has_outlet
        @invoices = Invoice.where(product_id: Product.where(outlet_id: current_user.outlet.id).ids)
      else
        @invoices = []
      end
    elsif current_user.is_customer?
      @invoices = Invoice.where(user_id: current_user.id)
    end
  end

  # GET /invoices/1 or /invoices/1.json
  # def show
  # end

  # GET /invoices/new
  # def new
  #   @invoice = Invoice.new
  # end

  # GET /invoices/1/edit
  # def edit
  # end

  # POST /invoices or /invoices.json
  def create
    authorize Invoice
    # get product
    @product = Product.find(params[:product_id])
    # if product has stock then proceed else cancle
    if @product.has_stock && params[:quantity].to_i <= @product.quantity.to_i
      # decrese the product quantity
      @product.quantity = (@product.quantity).to_i - (params[:quantity]).to_i
      # save the quantity
      @product.save
      # initialize new invoice instances
      @invoice = Invoice.new
      # assign the invoice quantity
      @invoice.qty = params[:quantity]
      # assign the price for product
      @invoice.price = @product.price
      # assign invoice address
      @invoice.address = params[:address]
      # calculate the total invoice price
      total = (params[:quantity]).to_i * (@product.price).to_i
      # save the total
      @invoice.total = total
      # set the user id for whom this invoice is
      @invoice.user_id = current_user.id
      # set the product id for which we are creating the invoice
      @invoice.product_id = @product.id
      # responde to different request
        # save the invoice and if successfull proceed else cancle and send error message
      if @invoice.save
        # send invoice message to user
        # InvoiceMailer.with(email:current_user.email, invoice:@invoice).sendInvoice.deliver
        redirect_back fallback_location: products_url, notice: "You order was successfull, Please check your mailbox"
      else
        redirect_back fallback_location: products_url, notice: "You order was unsuccessfull"
      end
    else
      redirect_back fallback_location: products_url, notice: "You order was unsuccessfull"
    end
  end

  # PATCH/PUT /invoices/1 or /invoices/1.json
  # def update
  #   respond_to do |format|
  #     if @invoice.update(invoice_params)
  #       format.html { redirect_to @invoice, notice: "Invoice was successfully updated." }
  #       format.json { render :show, status: :ok, location: @invoice }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @invoice.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /invoices/1 or /invoices/1.json
  # def destroy
  #   authorize @invoice
  #   @invoice.destroy
  #   respond_to do |format|
  #     format.html { redirect_to invoices_url, notice: "Invoice was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_invoice
    #   @invoice = Invoice.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    # def invoice_params
    #   params.require(:invoice).permit(:qty, :price, :total)
    # end
end
