class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  belongs_to :user
  belongs_to :address

  extend FirstOrBuild

  def subtotal
    order_items.map(&:subtotal).reduce(:+)
  end

  def discount
    0
  end

  def shipping
    order_items.map(&:quantity).reduce(:+) * 2.50
  end

  def total
    subtotal + shipping - discount
  end

end
