class Promotion
  attr_accessor :units_to_buy
  def initialize(units)
    @units_to_buy = units
  end

  def apply(units, unit_price)
    0
  end
end

=begin
Discount promotions apply a percentage of discount to every item of that kind in the 
purchase if you buy at least N units. 
For example
  Buy 3 mugs and get a 10% off in every mug
=end
class DiscountPromotion < Promotion
  attr_accessor :discount

  def initialize(units_to_buy, discount)
    super units_to_buy
    @discount = discount
  end

  def apply(units, unit_price)
    price_pct = 1.00 - (@discount/100.00)
    (units * unit_price * price_pct).round(2)
  end

  def to_s  
    "[#{self.class.name}] - Buy #{@units_to_buy} and get #{@discount}% off"
  end

end

=begin
Pack promotions are those that when you buy a given number of items of the same kind, 
you just pay some of them.
For example
  Buy 3 t-Shirts and pay only 2
=end
class PackPromotion < Promotion
  attr_accessor :units_to_pay

  def initialize(units_to_buy, units_to_pay)
    super units_to_buy
    @units_to_pay = units_to_pay
  end

  def apply(units, unit_price)
    packs = units / @units_to_buy
    units_to_pay_in_packs = packs * @units_to_pay
    rest = (units % @units_to_buy)
    ((units_to_pay_in_packs + rest) * unit_price).round(2)
  end

  def to_s  
    "[#{self.class.name}] - Buy #{@units_to_buy} and pay only #{@units_to_pay}"
  end

end

=begin 
Final price promotions are those that, when you buy N units, you pay a known price.
For Example
  Buy 3 vouchers and pay 5.5 euro
=end
class FinalPricePromotion < Promotion
  attr_accessor :final_price

  def initialize(units_to_buy, final_price)
    super units_to_buy
    @final_price = final_price
  end

  def apply(units, unit_price)
    packs = units / @units_to_buy
    rest = (units % @units_to_buy) * unit_price
    ((packs * @final_price) + rest).round(2)
  end

  def to_s  
    "[#{self.class.name}] - Buy #{@units_to_buy} and pay #{@final_price}€ for them"
  end
end