class CashRegister 
    def initialize(discount = 0)
        @total = 0
        @discount = discount 
        @items = []
        @last_item = 0 
    end 
require 'pry'
    attr_accessor :total 
    attr_accessor :discount
    attr_accessor :items 
    attr_accessor :last_item

    def add_item(item, price, quant = 1)
        self.total += price * quant
        self.items.fill(item, self.items.size, quant) 
        self.last_item = price * quant 
    end 

    def apply_discount
        if self.discount == 0
            return "There is no discount to apply." 
        end 
        self.total = (self.total - (self.total * (@discount.to_f / 100)))
        return "After the discount, the total comes to $#{self.total.to_i}."
        #binding.pry 
    end  

    def items 
        @items
    end  

    def void_last_transaction
        self.total -= self.last_item 
        self.items.pop
        # if self.items.empty? 
        #     self.total = 0.0
        # end  
    end 
end 
