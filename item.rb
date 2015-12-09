require './promotions'

class Item
	attr_accessor :name
	attr_accessor :price
		
	def initialize(name, price)
		@name = name
		@price = price
	end

	def to_s  
		"name=[#{@name}] - price[#{@price}]"
	end
end