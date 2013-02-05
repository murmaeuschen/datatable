class Itemstable < ActiveRecord::Base
  has_many :items
  belongs_to :order
  attr_accessible :price_per_line, :quantity
end
