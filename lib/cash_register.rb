
class CashRegister
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @cart = []
    end

    attr_accessor :total, :discount, :items, :cart

    def add_item(title, price, quantity = 1)
        charge = price * quantity
        self.total += charge

        quantity.times do
            self.items.push(title)
        end
        self.cart.push([title, charge])
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total *= (1 - 0.01 * self.discount)
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        self.items.pop
        last_transaction = self.cart.pop
        self.total -= last_transaction[1]
    end
end
