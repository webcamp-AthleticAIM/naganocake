class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  has_many :order_details, dependent: :destroy
  attachment :image

  enum payment: { credit_card: 0, transfer: 1 }

  def order_addresses
    Order.select(:postal_code, :address, :name)
  end

  validates :name, :postal_code, :address, presence: true
end
