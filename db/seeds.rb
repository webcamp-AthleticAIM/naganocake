# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@naganocake.com',
  password: 'admin1234'
)

Order.create!(
  customer_id: 1,
  name: 'hogehoge',
  postal_code: '1234567',
  address: '東京都代々木一丁目',
  payment: 0,
  postage: 800,
  total_payment: 972,
  order_status: 0,
)

OrderDetail.create!(
       item_id: 1,
       order_id: 1,
       item_quantity: 1,
       price: 432,
       production_status: 0
)
