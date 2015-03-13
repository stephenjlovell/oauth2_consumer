# create_table "products", force: :cascade do |t|
#   t.string   "title"
#   t.text     "description"
#   t.decimal  "price"
#   t.string   "image_url"
#   t.integer  "stock"
#   t.datetime "created_at",  null: false
#   t.datetime "updated_at",  null: false
# end

class UpdateProduct < ActiveRecord::Migration
  def up
    rename_column :products, :title, :name
    remove_column :products, :image_url
  end

  def down
    rename_column :products, :name, :title
    add_column :products, :image_url
  end
end
