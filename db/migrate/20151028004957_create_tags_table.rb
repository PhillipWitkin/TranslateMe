class CreateTagsTable < ActiveRecord::Migration
  def change
    create_table :tags do |t|

      t.integer :card_id
      t.integer :category_id
      
      t.timestamps null: false
    end
  end
end
