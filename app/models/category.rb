class Category < ActiveRecord::Base
  has_many :tags
  has_many :cards, through: :tags

  validates :category_name, presence: true
  validates :category_name, uniqueness: true
  validates :category_name, length: { minimum: 3}

  def self.fix_up_categories(categories)
    cat_array = categories.split(",")
    fixed_cats = cat_array.map { |cat| cat.strip.gsub(/ /, '_').gsub(/\W/, "") }
    # created_cats = []
    # uncreated_cats = []
    # fixed_cats.each do |cat|
    #   found_cat = self.find_by(category_name: cat)
    #   if found_cat
    #     created_cats.push(found_cat)
    #   else
    #     uncreated_cats.push(cat)
    #   end
    # end
    created_cats = self.where(category_name: fixed_cats)
    created_cats.each do |cat|
      fixed_cats.delete(cat.category_name)    
    end
    # return an array of categories that exist, and another array of each new category 
    return [created_cats, fixed_cats] 
  end



end