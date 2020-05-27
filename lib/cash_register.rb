require 'pry'
class CashRegister
    attr_accessor :discount, 
    :price, :total, :quantity, :items

    def initialize(discount= 0)
        @discount = discount
        @total = 0 
        @items = []
    end
    
    def add_item(item, price, quantity= 1)
        quantity.times do 
            @items << item 
        end
        @final = @total 
        @total += price * quantity   
    end 


    def apply_discount
        if discount > 0
            @total -= total * discount / 100
            return "After the discount, the total comes to $#{@total}."
        else 
            return "There is no discount to apply."
        end
    end 

    def void_last_transaction
        @total = @final
    end 
end 
