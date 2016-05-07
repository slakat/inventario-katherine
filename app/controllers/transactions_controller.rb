class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  def creating_transaction
    products_ids = transaction_params[:transaction_products].reject(&:empty?)
    @products = []
    products_ids.each do |id|
      p = Product.find(id)
      @products << TransactionProduct.new(name: p.name, quantity: 1, price: p.price ,product_id:id)
    end

    services_ids = transaction_params[:transaction_services].reject(&:empty?)
    @services = []
    services_ids.each do |id|
      s = Service.find(id)
      @services << TransactionService.new(name: s.name,  price: s.price , service_id: id)
    end

    extras_ids = transaction_params[:extras].reject(&:empty?)
    @extras = []
    extras_ids.each do |id|
      p = ExtraProduct.find(id)
      @extras << Extra.new(name: p.name, price: p.price, quantity: 100 ,extra_product_id: id, cost: p.cost)
    end

  end

  def transaction_details

  end

  def transaction_preview
    @transaction =  Transaction.new
    products = []
    services = []
    extras = []

    unless params[:products].nil?
      params[:products].each do |p|
        products << TransactionProduct.new(product_params(p))
      end
    end

    unless params[:services].nil?
      params[:services].each do |p|
        services << TransactionService.new(service_params(p))
      end
    end

    unless params[:extras].nil?
      params[:extras].each do |p|
        extras << Extra.new(extra_params(p))
      end
    end

    @transaction.transaction_products << products
    @transaction.transaction_services << services
    @transaction.extras << extras
    @transaction.total = @transaction.calculate_total

  end

  # POST /transactions
  def create
    @transaction = Transaction.new(transaction_params)
    products = []
    services = []
    extras = []

    unless params[:products].nil?
      params[:products].each do |p|
        products << TransactionProduct.new(product_params(p))
      end
    end

    unless params[:services].nil?
      params[:services].each do |p|
        services << TransactionService.new(service_params(p))
      end
    end

    unless params[:extras].nil?
      params[:extras].each do |p|
        extras << Extra.new(extra_params(p))
      end
    end

    @transaction.transaction_products << products
    @transaction.transaction_services << services
    @transaction.extras << extras

    Transaction.transaction do
      @transaction.save
    end

    if @transaction.persisted?
      redirect_to @transaction, notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      redirect_to @transaction, notice: 'Transaction was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy
    redirect_to transactions_url, notice: 'Transaction was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transaction_params
      params.require(:transaction).permit(:total, :transaction_products=>[], :transaction_services=>[], :extras=>[], :products=>[], :services=>[])
    end

    def product_params p
      p.permit(:price, :name, :product_id, :quantity)
    end

    def service_params p
      p.permit(:price, :name, :service_id)
    end

    def extra_params p
      p.permit(:price, :name,:quantity, :extra_product_id, :cost)
    end

end
