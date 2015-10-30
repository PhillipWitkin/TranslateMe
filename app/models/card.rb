class Card < ActiveRecord::Base

  has_many :favorites
  has_many :users, through: :favorites

  has_many :translations
  has_many :users, through: :translations

  has_many :tags
  has_many :categories, through: :tags

  default_scope { order(:updated_at) }

  def self.user_translations(current_user)
    all_user_translations = self.joins(:translations).where(translations: {user_id: current_user[:id]})
    return all_user_translations 
  end

end