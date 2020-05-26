class CashRegister
    attr_accessor :discount, :total, :items, :last_item_price
    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end 

    def add_item(item, price, quantity = 1)
        self.total += price * quantity
        quantity.times do 
            self.items << item
        end 
        self.last_item_price = price * quantity
    end  

    def apply_discount
        if discount > 0
            self.total -= self.total * (self.discount.to_f / 100)
            self.total = self.total.to_i
            "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end 
    end 

    def void_last_transaction
        self.total -= self.last_item_price
    end 
end