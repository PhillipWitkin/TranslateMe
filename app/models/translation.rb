class Translation < ActiveRecord::Base
  belongs_to :card
  belongs_to :user

  validates :translation, presence: true

  def self.card_translations(current_card_id)
    all_card_translations = self.joins(:card).where(card_id: current_card_id)
    return all_card_translations
  end

end