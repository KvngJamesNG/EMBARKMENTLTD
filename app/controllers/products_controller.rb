class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
  @product = Product.find(params[:id])
  @user_wishlist = @product.wishlists.find_by(user: current_user) if user_signed_in?
end

end