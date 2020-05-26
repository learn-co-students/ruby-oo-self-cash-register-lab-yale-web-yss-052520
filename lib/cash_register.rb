require 'pry'
class CashRegister


    attr_accessor :discount, :total

    def initialize(discount = 0.0)
        @discount = discount
        @arr = []
        @total = 0.0
    
    end

    def add_item(item_name, price, quantity = 1)
        @total += price * quantity
        
            @arr << [item_name, price, quantity]
        
    end
    def apply_discount
        @total = @total * (100 - @discount) / 100
        if @discount == 0.0
            return "There is no discount to apply."
        else
            return "After the discount, the total comes to $#{@total.to_i}."
        end
    end
    def items
        output = []
        @arr.each do |element|
            (1..element[2]).each do 
                output << element[0]
            end
        end
        output
    end
    def void_last_transaction
        (1..@arr[-1][2]).each do
            @total = @total - @arr[-1][1]
        end
        @arr.pop()

    end

end

