class CashRegister
	attr_accessor :total, :discount, :items, :last_transaction

	def initialize(discount = 0)
		@total = 0
		@discount = discount
		@items = []
		@last_transaction = []
	end

	def add_item(title, price, quantity = 1)
		@total += price * quantity
		quantity.times do
			@items << title 
			@last_transaction = [title, price, quantity]
		end
	end

	def apply_discount
		if @discount == 0
			return "There is no discount to apply."
		end
		@total = @total * (1.0-discount/100.0)
		return "After the discount, the total comes to $#{@total.to_i}."
	end

	def void_last_transaction
		undo_last(@last_transaction[1], @last_transaction[2])
	end

	def undo_last(price, quantity)
		quantity.times do
			@items.pop()
			@total -= price
		end
	end
end
