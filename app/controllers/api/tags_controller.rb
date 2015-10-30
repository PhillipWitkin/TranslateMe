module Api
  class TagsController < ApplicationController

    def create
      new_tag = Tag.new(tag_params)
      new_tag.save
      render json: new_tag.to_json
    end

    def destroy
      poor_tag = Tag.find()
      poor_tag.destroy
      render json: poor_tag.to_json
    end
    private
      def tag_params
        params.require(:tag).permit(:card_id, :category_id)
      end
  end
end