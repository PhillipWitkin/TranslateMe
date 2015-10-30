class TagMaker
  attr_accessor :categories

  def initialize(category_list)
    cat_array = category_list.split(",")
    fixed_cats = cat_array.map { |cat| cat.strip.gsub(/ /, '_').gsub(/\W/, "") }

    created_cats = Category.where(category_name: fixed_cats)
    created_cats.each do |cat|
      fixed_cats.delete(cat.category_name)    
    end
    # return an array of categories that exist, and another array of each new category 
    @categories = [created_cats, fixed_cats]  
    return @categories
  end

  def generate_tags(card)
    @categories[0].each do |cat|
    new_tag = Tag.new(card_id: card.id, category_id: cat.id)
    new_tag.save
    # new_tag.valid?
    puts "new tag #{new_tag.card_id} has errors: #{new_tag.errors.full_messages}"
    end

      # create new categories, then tags for them
    @categories[1].each do |cat|
    new_category = Category.new(category_name: cat)
    new_category.save
    
    new_tag = Tag.new(card_id: card.id, category_id: new_category.id)

    new_tag.save
    # new_tag.valid?
    puts "new category #{new_category.category_name}, new tag with card number #{new_tag.card_id} has errors #{new_tag.errors.full_messages}"   
    end

  end

end