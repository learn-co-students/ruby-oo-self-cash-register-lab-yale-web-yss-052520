require "pry"

class CashRegister
    attr_accessor :total, :discount
    def initialize(discount = 0)
        @items_array = []
        @total= 0
        @discount = discount
        @array_of_prices = []
    end
    def add_item(item_title, item_price, item_quantity = 1)
        @item_title = item_title
        item_quantity.times do
            @items_array << item_title
        end
        transaction_price = item_quantity * item_price
        @array_of_prices << transaction_price
        @total += (transaction_price)
    end
    def apply_discount
        if !(@discount == 0)
            @total = @total * (100- @discount)/100
            return "After the discount, the total comes to $#{@total}."
        elsif @discount == 0
            return "There is no discount to apply."
        end
    end 
    def items
        @items_array 
    end
    def void_last_transaction
        @total -= @array_of_prices.last
        @array_of_prices.pop
    end
    # binding.pry
end

