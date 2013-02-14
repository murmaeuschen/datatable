class Item < ActiveRecord::Base
  attr_accessible :item_description, :item_name, :price 
  has_one :order_item
  has_many :orders, :through => :order_items
end
