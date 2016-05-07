class ExtraProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @products = ExtraProduct.all
    respond_to do |format|
      format.html
      format.json{
        render :json => @products.to_json
      }
      end
  end

  def extra_price
    price = ExtraProduct.find(params[:id]).calculate_price_extra(params[:percentage].to_i)
    render json: price.as_json
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = ExtraProduct.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = ExtraProduct.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to extra_products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = ExtraProduct.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:extra_product).permit(:nature,:quantity,:name, :cost, :price, :state, :product_id, :code)
    end
end
