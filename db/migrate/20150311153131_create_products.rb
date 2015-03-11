class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image_url
      t.integer :stock

      t.timestamps null: false
    end
  end
end
