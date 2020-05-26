require 'pry'
class CashRegister

    attr_accessor :total, :discount, :items, :itemPrice

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
        @itemPrice = {}
    end

    def add_item(title, price, quant=1)
        item_array_helper(title, price, quant)
        # binding.pry
        store_price(title, price, quant)

        self.total += (price * quant)
    end

    def apply_discount
        if !self.discount
            return "There is no discount to apply."
        end
        self.total -= (self.total * discount_to_decimal(self.discount))

        "After the discount, the total comes to $#{self.total.to_int}."
    end

    def void_last_transaction
        # binding.pry
        self.total -= get_item_price(get_last_item)
        # binding.pry
    end


    # class helper methods
    def store_price(title, price, quant)
        self.itemPrice[title] = price * quant
    end

    def item_array_helper(title, price, quant)
        quant.times do
            self.items << title
        end
    end

    def get_last_item
        self.items[-1]
    end

    def get_item_price(title)
        self.itemPrice[title]
    end

end

# non-specific helper methods
def discount_to_decimal(discount)
    discount /= 100.0
end

