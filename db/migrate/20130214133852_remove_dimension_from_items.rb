class RemoveDimensionFromItems < ActiveRecord::Migration
  def up
  	remove_column :items, :dimension   
  end

  def down
  	add_column :items, :dimension, :string
  end
end
