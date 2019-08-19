def consolidate_cart(cart)
  cart_hash = {}
  
  cart.each do |item|
    item.each do |key, value|
      if cart_hash[key]
        cart_hash[key][:count] += 1
      else
        cart_hash[key] = value
        cart_hash[key][:count] = 1
      end
    end
  end
  cart_hash
end

def apply_coupons(cart, coupons)
  coupons.each {|coupon|
    if cart[coupon[:item]] and (cart[coupon[:item]][:count] >= coupon[:num])
         if cart["#{coupon[:item]} W/COUPON"] 
           cart["#{coupon[:item]} W/COUPON"][:count] += coupon[:num]
         else
           discounts = "#{coupon[:item]} W/COUPON"
           cart[discounts] = {
             :price = (coupon[:cost]/coupon[:num]),
             :clearance = cart[coupon[:item]][:clearance],
             :count = coupon[:num]
           }
         end
         cart[coupon[:item]][:count]  -=coupon[:num]
      end
    }
   return cart
end 

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
