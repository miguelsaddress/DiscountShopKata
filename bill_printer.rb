class BillPrinter
	attr_reader :bill

	def initialize(all_items, promo_items, no_promo_items, total, total_with_promos)
		@all_items = all_items
		@promo_items = promo_items
		@no_promo_items = no_promo_items
		@total = total
		@total_with_promos = total_with_promos
		@bill = ""
		build_bill
	end

	def build_bill
		add_purchase_no_discounts_info
		add_discounts_info
		add_items_wo_promotions_info
		add_totals_info
	end

	def add_purchase_no_discounts_info
		add_your_purchase_header;
		
		@all_items.each do |item_name, items|
			add_item_line_to_bill(item_name, items.length, items[0].price)
		end 
		@bill += "\n\n"
	end

	def add_your_purchase_header
		@bill += "\t=========================="
		@bill += "\n\t\tYOUR PURCHASE"
		@bill += "\n\t=========================="
	end

	def add_discounts_info
		@bill += "\n\t==========="
		@bill += "\n\t DISCOUNTS"
		@bill += "\n\t==========="
		@promo_items.each do |item_name, info_hash| 
			add_applied_promo_to_bill(item_name, info_hash)
		end
		@bill += "\n"
	end

	def add_items_wo_promotions_info
		@bill += "\n\t========================"		
		@bill += "\n\tITEMS WITHOUT PROMOTIONS"
		@bill += "\n\t========================"

		@no_promo_items.each do |item_name, items|
			add_item_line_to_bill(item_name, items.length, items[0].price)
		end
	end

	def add_totals_info
		savings = @total - @total_with_promos
		@bill += "\n\n"
		@bill += "\n\t========================================="
		@bill += "\n\tTOTAL: #{@total_with_promos}€"
		@bill += "\n\n\tTOTAL W/O PROMOTIONS: #{@total}€"
		@bill += "\n\tYOU SAVED: #{savings}€"
		@bill += "\n\t========================================="
	end

	def add_item_line_to_bill(item_name, items_length, item_price)
		line_total = item_price * items_length
		@bill += "\n\t"
		@bill += "#{item_name} x (#{items_length}), #{item_price}€ each = #{line_total}€"
	end

	def add_applied_promo_to_bill(item_name, info_hash)
		@bill += "\n\t #{item_name}\n"
		@bill += "\t\tAPPLIED PROMO: #{info_hash["applied_promo"]}\n"
		@bill += "\t\tFinal price for all #{item_name}s: #{info_hash["promo_price"]}€"
		@bill += "\n\n"
	end

end
