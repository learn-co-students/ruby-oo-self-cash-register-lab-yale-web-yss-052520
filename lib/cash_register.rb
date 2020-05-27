class CashRegister
    attr_accessor :discount, :total, :items_lst, :last_transaction

    def initialize(discount = 0, total = 0)
        @total = total
        @discount = discount
        @items_lst = []
    end

    def add_item(title, price, quantity = 1)
        quantity.times {self.items_lst << title}
        self.last_transaction = {:title => title, :price => price, :quantity => quantity}
        self.total += price * quantity
    end

    def apply_discount
        if discount != 0
            self.total -= self.discount.to_f / 100 * self.total
            return "After the discount, the total comes to $#{self.total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        self.items_lst
    end

    def void_last_transaction
        self.last_transaction[:quantity].times {self.items_lst.pop}
        self.total -= self.last_transaction[:price] * self.last_transaction[:quantity]
    end

end