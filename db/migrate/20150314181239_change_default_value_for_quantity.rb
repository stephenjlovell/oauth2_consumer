class ChangeDefaultValueForQuantity < ActiveRecord::Migration
  def up
    change_column :order_items, :quantity, :integer, default: 1
  end

  def down
    change_column :order_items, :quantity, :integer, default: 0
  end
end
