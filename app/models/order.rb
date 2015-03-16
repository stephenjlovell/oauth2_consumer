class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  belongs_to :user
  belongs_to :address

  extend FirstOrBuild

  def subtotal
    order_items.map(&:subtotal).reduce(:+) || 0
  end

  def item_count
    order_items.map(&:quantity).reduce(:+) || 0
  end

  def percent_discount
    if user && user.verified?
      case user.affiliation
      when "Service Member", "Veteran", "Military Spouse", "Military Family", "Retiree"
        0.1
      else
        0.0
      end 
    else
      0.0
    end
  end

  def discount
    -(subtotal * percent_discount) 
  end

  def shipping
    item_count * 2.50
  end

  def total
    (subtotal * (1 - percent_discount)) + shipping
  end



end
