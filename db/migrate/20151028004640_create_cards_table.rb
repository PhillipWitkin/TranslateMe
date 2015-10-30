class CreateCardsTable < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :english_phrase
      t.string :explanation

      t.timestamps null: false
    end
  end
end
