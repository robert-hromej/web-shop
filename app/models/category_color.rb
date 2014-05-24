class CategoryColor < ActiveRecord::Base
  belongs_to :category
  belongs_to :color

end
