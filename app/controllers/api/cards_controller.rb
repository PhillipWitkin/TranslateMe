module Api
  class CardsController < ApplicationController
    def index
      all_cards= Card.all()
      render json: all_cards.to_json( include: {
        # users: => current_user,
        categories: {only: [:category_name]},
        translations: {
            include: {
              user: {only: [:username]},
            }
          } 
        })
    end

    def show
      card = Card.find(params[:id])
      render json: card.to_json( include:{
        categories: {only: [:category_name]},
        translations:{
          include:{
            user:{only: [:username]}
          }
        }
      })

    end

    def create
      # get params for the new card, persist to DB
      new_card = Card.new(card_params)
      new_card.save

      categories = TagMaker.new(params[:category_name])
      categories.generate_tags(new_card)
  # differentiate any new categories from those already in DB 
      # categories = Categpry.fix_up_categories(params[:category_name])
      # puts categories
      # # make tags for existing categories
      # categories[0].each do |cat|
      #   new_tag = Tag.new(card_id: new_card.id, category_id: cat.id)
      #   new_tag.save
      # end

      # # create new categories, then tags for them
      # categories[1].each do |cat|
      #   new_category = Category.new(category_name: cat)
      #   new_category.save

      #   new_tag = Tag.new(card_id: new_card.id, category_id: new_category.id)
      #   new_tag.save
      # end

      render json: new_card.to_json( include:{
        categories: {only: [:category_name]},
        translations:{
          include:{
            user:{only: [:username]}
          }
        }
      })
    end


    def update
      # THIS METHOD DOES NOT UPDATE A CARD'S ROW/DATA/ATTRIBUTES IN THE DATABASE.

      # creating a new translation with the data the user submitted and linking it to the user_id and card_id
      new_translation = Translation.new({translation: params[:translation], language: params[:language], phonetic: params[:phonetic], meaning: params[:meaning], user_id: params[:user_id], card_id: params[:card_id]})
      new_translation.save

      # Returning the card model, along with the updated translation included in the thing
      card = Card.find(params[:card_id])
      render json: card.to_json( include:{
        categories: {only: [:category_name]},
        translations:{
          include:{
            user:{only: [:username]}
          }
        }
      })

    end


    def destroy
      #admin only
      card_no_longer = Card.find(params[:id])
      card_no_longer.destroy
      render json: card_no_longer.to_json
    end 

    private
      def card_params
        params.require(:card).permit(:english_phrase, :explanation, :category_name, :translation, :language, :phonetic, :meaning, :user_id, :card_id)
      end

  end
end