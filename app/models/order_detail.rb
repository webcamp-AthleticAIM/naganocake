class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order
  enum production_status_method: {production_impossible:0, production_wait:1,  in_production:2,  production_completed:3}
end
