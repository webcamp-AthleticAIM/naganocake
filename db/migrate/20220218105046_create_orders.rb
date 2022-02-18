class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :payment
      t.integer :postage
      t.integer :total_payment
      t.integer :order_status

      t.timestamps
    end
  end
end
