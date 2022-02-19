class Item < ApplicationRecord
  validates :name, :price, :image, :introduction,  presence: true

  # has_many:cart_items, dependent: :destroy
  # has_many:order_details, dependent: :destroy
  # belongs_to:genre

  attachment :image

  def add_tax_price
        (self.price * 1.10).round
  end


end
