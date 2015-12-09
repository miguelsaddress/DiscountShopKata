class ItemFactory
	@@mug = nil
	@@tshirt = nil
	@@voucher = nil

	def self.mug
		if @@mug.nil?
			@@mug = Item.new("Mug", 15.00)
		end
		@@mug
	end

	def self.tshirt
		if @@tshirt.nil?
			@@tshirt = Item.new("T-Shirt", 20.00)
		end
		@@tshirt
	end

	def self.voucher
		if @@voucher.nil?
			@@voucher = Item.new("Voucher", 7.50)
		end
		@@voucher
	end
end
