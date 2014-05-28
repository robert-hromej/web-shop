class CardItem < ActiveRecord::Base
  belongs_to :card
  belongs_to :customer
  belongs_to :product
  belongs_to :size
  belongs_to :color

end
