class CartItem < ApplicationRecord
  validates :item_amount,  presence: true

  belongs_to :item
  belongs_to :customer

  def subtotal
    item.with_tax_price * item_amount
  end
end
