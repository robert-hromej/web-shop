class Product < ActiveRecord::Base
  belongs_to :category
  has_many :card_items
  has_many :product_items

end
