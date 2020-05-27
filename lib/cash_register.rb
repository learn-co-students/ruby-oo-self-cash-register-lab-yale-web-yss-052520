require "pry"

class CashRegister

attr_accessor :total, :discount, :items, :last_item

    def initialize(discount= nil)
        @total = 0
        @discount = discount
        @items = []
    end 

    def add_item(title, price, quantity = 1)
        @total += price*quantity
        quantity.times do @items << title
        end
        @last_item = [title, price, quantity]
    end

    def apply_discount
        if @discount
            @total = @total - @total*@discount/100
            return "After the discount, the total comes to $800."
        else 
            return "There is no discount to apply."
        end
  
    end
    
    def void_last_transaction 
        last_price = @last_item[1]
        last_quantity = @last_item[2]
        @total -= last_price*last_quantity
    end
end
