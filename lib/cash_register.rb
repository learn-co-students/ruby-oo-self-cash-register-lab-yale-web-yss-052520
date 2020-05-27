class CashRegister
    
    attr_accessor :discount, :total, :items, :item_price, :void_last_transaction 
    
    def initialize(discount=0)
        @discount = discount 
        @total = 0
        @items = []
        @item_price = []
    end

    def add_item(title, price, quantity=1)
         quantity.times do 
            @items << title
         end
         @item_price << price 
        cost_change = price * quantity
         @total += cost_change
    end



    def apply_discount
         if @discount > 0
             @total = @total * (1 - (@discount.to_f / 100.0))
             return "After the discount, the total comes to $#{@total.to_int}."
         else 
             return "There is no discount to apply."
         end
    end

    def items
         @items 
    end

#     # attr_accessor :

    def void_last_transaction
          @total -= @item_price[-1]
          @item_price.delete_at(-1)
          if @item_price.empty?
             @total = 0.0
          end
    end
end