class CashRegister
    
    attr_accessor :total, :discount, :items, :prices, :quantities

    def initialize(discount = nil)
        @total = 0.0
        @discount = discount
        @items = []
        @prices = []
        @quantities = []
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        quantity.times do 
            @items << title
            @prices << price
        end
        @quantities << quantity
    end

    def apply_discount
        return "There is no discount to apply." if !@discount
        @total = @total * (1 - (@discount / 100.0))
        return "After the discount, the total comes to $#{@total.round}."
    end

    def void_last_transaction
        quantities[-1].times do
            @items.pop
            @total = @total - @prices.pop
        end
    end
end
