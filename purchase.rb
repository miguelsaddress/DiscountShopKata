require "./bill_printer"

class Purchase
	def initialize(promotions)
		@promotions = promotions
		@items = Hash.new
		@total = 0
	end

	def add(item)
		@items[item.name] = [] unless @items.has_key? item.name
		@items[item.name] << item
		@total += item.price 
	end

	def num_items_of(item_name)
		if @items.has_key? item_name
			@items[item_name].length
		else
			0
		end
	end


	def calculate_total_applying_promos(applicable_promotions, no_promo_items)
		total_with_promos = 0
		applicable_promotions.each do | k, info_hash|
		 	total_with_promos += info_hash['promo_price']
		end
		
		no_promo_items.each do |item_name, items|
			subtotal = items[0].price * items.length
			total_with_promos += subtotal
		end 
		total_with_promos
	end

	def get_bill
		applicable_promotions = get_applicable_promotions
		no_promo_items = @items.select { |name| !applicable_promotions.has_key? name }
		total_with_promos = calculate_total_applying_promos(applicable_promotions, no_promo_items)
		printer = BillPrinter.new(@items, applicable_promotions, no_promo_items, @total, total_with_promos)
		printer.bill
	end

	def get_applicable_promotions
		applicable_promotions = {}
		@items.each do |item_name, items|
			applicable_promos = filter_promotions_for item_name
			next if applicable_promos.empty?

			num_items = num_items_of item_name
			item_price = items[0].price
			prices = applicable_promos.map do |p|
				p.apply(num_items, item_price)
			end
			min_price_and_index = prices.each_with_index.min
			promo_price = min_price_and_index[0]
			index_of_min_price = min_price_and_index[1]
			applied_promo = applicable_promos[index_of_min_price]
			applicable_promotions[item_name] = {}
			applicable_promotions[item_name]["promo_price"] = promo_price
			applicable_promotions[item_name]["applied_promo"] = applied_promo
		end
		applicable_promotions
	end

	def filter_promotions_for(item_name)
		num_items_in_purchase = num_items_of item_name
		item_promotions = @promotions[item_name]
		applicable_promos = item_promotions.select do |p| 
			p.units_to_buy <= num_items_in_purchase 
		end
	end

end
