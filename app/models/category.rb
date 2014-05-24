class Category < ActiveRecord::Base
  has_many :products

  has_and_belongs_to_many :colors, join_table: 'category_colors'
  has_and_belongs_to_many :sizes, join_table: 'category_sizes'

end
