class AddDimensionToOrderItems < ActiveRecord::Migration
  def up
    add_column :order_items, :dimension, :string   
  end

  def down
    remove_column :order_items, :dimension
  end
end
