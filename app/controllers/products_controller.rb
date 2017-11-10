class ProductsController < ApplicationController
  before_action :verify_object, only: :show
  def verify_object
   @prt = Product.find params[:id] rescue nil
   if @prt.nil?
     redirect_to products_path
     flash[:messagee] = "Wrong object entered"
   end
  end
  def index
    @productss = Product.all #u can give any name for object(productss)-> each object ll b available only for that template(method)
  end

  def new
    @product = Product.new
  end

  def create
    #params is a storm parameter in rails, which forms hash and carryout all the end values from browser to controller
    #params = {product:{name:"T-shirt", brand:"", product_type:"", price:""}}
    image_attributes = params[:product][:image]
    params[:product].delete(:image) #to delete from params bcz we saved it already in image_attributes (to get 2 dif hashes)
    @product = Product.new(params_product)
    if @product.save
      image_attributes[:pic].each do | image |
        img = Image.new(pic: image, sania: @product)
        img.save(validate: false)
      end
      redirect_to products_path
    else
      render "new"
    end
  end

  def edit
    @prdt = Product.find params[:id]
  end

  def show
    @prodt = Product.find params[:id]
  end

  def update
    @prdt = Product.find params[:id]
    if @prdt.update(params_product)
      redirect_to products_path
    else
      render "edit"
    end
  end

  def destroy
    @prot = Product.find params[:id]
    @prot.destroy
    redirect_to root_path
  end

  def params_product
    params.require(:product).permit!
  end
end
