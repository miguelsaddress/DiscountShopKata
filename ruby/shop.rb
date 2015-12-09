require "./item"

class Shop
  attr_reader :promotions, :mug, :tshirt, :voucher
  def initialize
    @mug = Item.new("Mug", 15.00)
    @tshirt = Item.new("T-Shirt", 20.00)
    @voucher = Item.new("Voucher", 7.50)
    
    @promotions = {}

    self.set_mug_promotions
    self.set_tshirt_promotions
    self.set_voucher_promotions
  end

  def set_mug_promotions
    @promotions[@mug.name] = []
    @promotions[@mug.name] << DiscountPromotion.new(3, 30)
    @promotions[@mug.name] << DiscountPromotion.new(4, 20)
    @promotions[@mug.name] << PackPromotion.new(4, 3)
    @promotions[@mug.name] << FinalPricePromotion.new(3, 20)
  end

  def set_tshirt_promotions
    @promotions[@tshirt.name] = []
    @promotions[@tshirt.name] << DiscountPromotion.new(4, 20)
    @promotions[@tshirt.name] << PackPromotion.new(4, 3)
    @promotions[@tshirt.name] << FinalPricePromotion.new(4, 65)
    @promotions[@tshirt.name] << FinalPricePromotion.new(3, 50)
  end

  def set_voucher_promotions
    @promotions[@voucher.name] = []
    @promotions[@voucher.name] << DiscountPromotion.new(2, 10)
    @promotions[@voucher.name] << PackPromotion.new(3, 2)
    @promotions[@voucher.name] << FinalPricePromotion.new(4, 20)
  end
end