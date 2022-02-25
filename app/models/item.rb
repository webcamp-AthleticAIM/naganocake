class Item < ApplicationRecord
  validates :name, :price, :image, :introduction,  presence: true
  validates :sales_status, inclusion: { in: [true, false] }
  has_many:order_details, dependent: :destroy
  belongs_to:genre

  attachment :image


  # 消費税を加えた商品価格
  def add_tax_price
    (self.price * 1.08).round
  end
end
