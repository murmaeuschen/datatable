class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  attr_accessible :price_per_line, 
                  :quantity,
                  :dimension,
                  :item_id
end