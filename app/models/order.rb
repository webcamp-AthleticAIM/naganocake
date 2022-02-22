class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  attachment :image

  enum payment: { credit_card: 0, transfer: 1 }
  
  def order_addresses
    Order.select(:postal_code, :address, :name)
  end
  
  enum order_addresses: { current_addresses: 0, select_addresses: 1, new_addresses: 2 } 

  
 
  validates :name, :postal_code, :address, presence: true
end
