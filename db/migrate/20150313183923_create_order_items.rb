class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :quantity, default: 0
      t.integer :order_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
