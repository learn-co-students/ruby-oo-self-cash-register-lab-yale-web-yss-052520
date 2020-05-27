class CashRegister

    attr_reader :discount, :items
    attr_accessor :total
    def initialize (discount=0)
        @total = 0
        @discount = discount
        @items = []
        @prices = []
    end

    def add_item(title, price, quantity=1)
        quantity.times{
            @total += price#(quantity * price)
            @items.push(title)
            @prices.push(price * quantity)
        }
    end

    def apply_discount
        return "There is no discount to apply." if @discount==0
        @total *= ((100-@discount.to_f)/100)
        @total = @total.to_i
        "After the discount, the total comes to $#{@total}."
    end

    def void_last_transaction
        (@prices.length == 0)? (@total = 0.0; return) : nil
        @total-=@prices.last
        @prices.pop
    end
end
