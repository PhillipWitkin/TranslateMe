class Tag < ActiveRecord::Base
  belongs_to :card
  belongs_to :category

  # validates_each :category do |record,attr,value|
  #   if record.category 
  #     record.errors.add(attr, "Uh-oh its WDI") if record.category.category_name == "WDI"
  #   end
  # end

end