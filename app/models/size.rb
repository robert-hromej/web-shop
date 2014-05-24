class Size < ActiveRecord::Base
  has_and_belongs_to_many :categories, join_table: 'category_colors'

end
