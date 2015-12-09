require "json"
require './purchase'
require './shop'


shop = Shop.new
purchase = Purchase.new(shop.promotions)
purchase.add shop.mug 
purchase.add shop.mug 
purchase.add shop.tshirt 
purchase.add shop.mug 
purchase.add shop.mug 
purchase.add shop.tshirt 
purchase.add shop.voucher 
purchase.add shop.voucher 
purchase.add shop.voucher 

# puts JSON.pretty_generate purchase.get_applicable_promotions
puts purchase.get_bill