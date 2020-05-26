class CashRegister
    attr_reader :discount
    attr_accessor :total, :items, :lastTransact
    def initialize(discount = 0)
        @discount = discount
        @items = []
        @total = 0
    end

    def add_item(item, price, amount = 1)
        @total += price * amount
        @items += [item] * amount
        @lastTransact = Transaction.new(item, price, amount)
    end

    def apply_discount()
        @total -= @total * @discount/100.00
        message = @discount == 0 ? "There is no discount to apply." : 
                    "After the discount, the total comes to $#{@total.round()}."
    end

    def void_last_transaction()
        @total -= @lastTransact.get_cost
    end

    class Transaction
        attr_accessor :item, :price, :amount

        def initialize(item, price, amount = 1)
            @item = item
            @price = price
            @amount = amount
        end

        def get_cost()
            @price * @amount
        end
    end
        
end


