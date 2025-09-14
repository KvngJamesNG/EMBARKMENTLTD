module Api
  class WishlistsController < ApplicationController
protect_from_forgery with: :null_session
  
   #Create a wishlist item for a product
   #delete a wishlist item for a product

   def create
    wishlist = Wishlist.create!(wishlist_params)
    respond_to do |format|
      format.json do
        render json: {
            id: wishlist.id,
            product_id: wishlist.product_id,
            user_id: wishlist.user_id
          }, status: :ok
        end
      end
    end

   def destroy
     wishlist = Wishlist.find(params[:id])
     wishlist.destroy

     respond_to do |format|
        format.json do
          # ✅ return confirmation message for frontend
          render json: { message: "Wishlist item removed", id: wishlist.id }, status: :ok
        end
      end
    end

private

    def wishlist_params
      params.require(:wishlist).permit(:user_id, :product_id)
    end
  end
end