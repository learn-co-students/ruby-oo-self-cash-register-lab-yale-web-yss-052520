
class CashRegister 
    def initialize(discount =0)
        @total = 0.0
        @discount = discount 
        @items = [] 
        @memory = []
    end 
    attr_accessor :total
    attr_accessor :discount 
    attr_accessor :items  
    attr_accessor :memory 
    def add_item(item, price , quantity = 1) 
        @total += price * quantity 
        quantity.times do 
            @items << item 
        end 
        @memory = [item, price, quantity] 
    end  
    def apply_discount 
        if @discount == 0 
            return "There is no discount to apply." 
        end 
        @total = @total - @total *(@discount.to_f / 100) 
        return "After the discount, the total comes to $#{@total.to_i}."
    end 
    def void_last_transaction 
            @items.pop(@memory[2])
            @total -= @memory[1]*@memory[2] 
    end 
end 