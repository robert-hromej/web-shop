class Color < ActiveRecord::Base
  has_many :card_items
  has_and_belongs_to_many :categories, join_table: 'category_colors'

end
