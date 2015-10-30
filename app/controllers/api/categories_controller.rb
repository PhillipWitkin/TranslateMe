module Api
  class CategoriesController < ApplicationController
    def index
      all_categories = Category.all()
      render json: all_categories.to_json(include: {
        cards: {
          only: [:english_phrase, :explanation, :updated_at, :id],
          include: {
            translations: {
              include:{
                user:{
                  only: [:username]
                }
              }
            } 
          }
        }
      })
    end

    def show
      category = Category.find(params[:id])

      # render all cards under current category
        #cards will include favorites(boolean on client side)

      render json: category.to_json(include: {
        cards: {
          only: [:english_phrase, :explanation],
          include: {
            translations: {
              include:{
                user:{
                  only: [:username]
                }
              }
            } 
          }
        }
      })
    end
    
  end
end