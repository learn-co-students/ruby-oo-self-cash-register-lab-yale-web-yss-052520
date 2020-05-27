class CashRegister
    attr_accessor :total, :items, :discount, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @items =[]
        @discount = discount
    end

    def add_item(title,price,quantity=1)
        self.total += (price * quantity)
        self.last_transaction = (price * quantity)
        quantity.times {self.items.push(title)}
    end

    def apply_discount()
        if discount != 0
            self.total = total * (1.0 - discount/100.0)
            "After the discount, the total comes to $#{total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction()
        self.total -= self.last_transaction
        total
    end



end

