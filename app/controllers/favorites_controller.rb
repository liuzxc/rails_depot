class FavoritesController < ApplicationController

  def index
    user = current_user
    @products = []  
  	user.favorites.each do |favorite|
      @products << Product.find(favorite.product_id)
    end

    unless @products.empty?
      render "store/index" and return
    else
      redirect_to store_url, :notice => "no any favorite!"
    end

    end
      # if @products
      #    render "store/index" 
      # end
  	# @product  = @favorite.product

  	# if @product
  	# 	render "products/index"
  	# end

  def new 
  	@favorite = Favorite.new
  end

  def create
  	user = current_user
  	product = Product.find_by_id(params[:product_id])
    favorite = Favorite.where(:product_id => product.id, :user_id => user.id)
    if favorite.empty? 
      @favorite = Favorite.create(:product_id => product.id, :user_id => user.id)
      redirect_to :back, :notice => "Favotite success!"
      return
    else
      redirect_to :back, :notice => "Has been favorited!"
    end

  end

  def update
  end

  def edit
  end

  def destroy
  end

end
