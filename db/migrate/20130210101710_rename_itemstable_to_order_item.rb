class RenameItemstableToOrderItem < ActiveRecord::Migration
  def up
    rename_table :itemstables, :order_items
  end

  def down
    rename_table :order_items, :itemstables
  end
end
