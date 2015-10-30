module Api
  class FavoritesController < ApplicationController

    def index
      # if logged_in? 
        favorites = Favorite.joins(:user).where(user_id: current_user[:id])
        render json: favorites.to_json
      # end 
    end


    # def all_cards
    #   # renders all card that meet our parameters
    #   favorites = Card.joins(:favorites).where(favorites: {user_id: current_user[:id]})
    #   render json: favorites.to_json( include: {
    #     favorites: {},
    #     categories: {only: [:category_name]},
    #     translations: {
    #         include: {
    #           user: {only: [:username]},
    #         }
    #       } 
    #     })
    # end 

    def create
      new_favorite = Favorite.new(favorite_params)
      new_favorite.save
      render json: new_favorite.to_json
    end

    def destroy
      favorite = Favorite.find(params[:id])
      favorite.destroy
      render json: favorite.to_json
    end

    private
      def favorite_params
        params[:user_id] = current_user[:id]
        params.permit(:user_id, :card_id)
      end

  end
end