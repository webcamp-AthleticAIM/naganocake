class Order < ApplicationRecord

  has_many :order_details,dependent: :destroy

  enum payment_method: {credit_card: 0, transfer: 1}
  enum order_status_method: {backorder: 0, payment_confirmation: 1,  in_production: 2, preparing: 3, sent: 4}
end
