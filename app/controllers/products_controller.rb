class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @category = Product.select(:category).distinct
   end

  #Complete product listing
  def complete
    @complete = Product.all
  end

  # Audio Product listing
  def audio
    @audio = Product.where('category'=> 'Audio')
  end

  # Cameras Product listing
  def cameras
    @cameras = Product.where('category'=> 'Cameras')
  end

  # Cameras Product listing first 5
  def computers
    @computers = Product.where('category'=> 'Computers and Tablets').limit(5)
  end

   # Cameras Product listing offset from 6 
  def computersoffset
    @computersoffset = Product.where('category'=> 'Computers and Tablets').offset(5)
  end

   # Cameras Product listing
  def whitegoods
    @whitegoods = Product.where('category'=> 'WhiteGoods')
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # Passing file attributes from the browser for importing CSV -- No Validations implemented yet :-(, Has to be perfect file.
  def import
    begin
      Product.import(params[:file])
      redirect_to root_url, notice: "Import Complete"
    rescue
      redirect_to root_url, notice: "Invalid CSV file format, purging data"
    end
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:productID, :category, :product_name, :price)
    end
end
