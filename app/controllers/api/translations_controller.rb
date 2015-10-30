module Api
  class TranslationsController < ApplicationController
    def index
      # all_user_translations = Card.joins(:translations).where(translations: {user_id: current_user[:id]})
      all_cards_with_user_translations = Card.user_translations(current_user)

      render json: all_cards_with_user_translations.to_json( include: {
        categories: {only: [:category_name]},
        translations: {
            include: {
              user: {only: [:username]},
            }
          } 
        })
    end 

    def card_translations
      # all_card_translations = Translation.joins(:card).where(card_id: params[:card_id])
      all_translations_for_card = Translation.card_translations(params[:card_id])

      render json: all_translations_for_card.to_json(  include: {
          user: {only: [:username]},
        })
    end

    def create
      new_translation = Translation.new(translation_params)
      new_translation.save
      render json: new_translation.to_json
    end

    def update
      changed_translation = Translation.find(params[:id])
      changed_translation.update(translation_params)
      render json: changed_translation.to_json 
    end

    def destroy
      #admin only
      dropped_translation = Translation.find(params[:id])
      dropped_translation.destroy
      render json: dropped_translation.to_json
    end

    private

      def translation_params
        params.permit(:translation, :language, :phonetic, :meaning, :user_id, :card_id)
      end
 
  end
end