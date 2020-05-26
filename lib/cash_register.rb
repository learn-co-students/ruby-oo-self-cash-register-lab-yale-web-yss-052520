require 'pry'

class CashRegister
    def initialize(discount=0)
        @total=0
        @cost_of_last_item=0
        @discount=discount
        @items_array=[]
    end
    attr_accessor :total, :discount, :items_array
    def add_item(title, price, quantity=1)
        quantity.times {@items_array.push(title)}
        @cost_of_last_item=price*quantity
        self.total+=@cost_of_last_item
    end
    def apply_discount
        return  "There is no discount to apply." if self.discount==0
        self.total-=(self.total*self.discount)/100
        "After the discount, the total comes to $#{self.total}."
    end
    def items
        @items_array
    end
    def void_last_transaction
        self.total-=@cost_of_last_item
        @old_total=0
        self.total
    end
end

