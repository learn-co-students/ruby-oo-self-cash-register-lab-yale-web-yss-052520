class CashRegister

  attr_accessor :discount, :total, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @item_prices = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times do @items << title end
    @item_prices << price * quantity
  end

  def apply_discount
    @total *= (1 - (discount * 0.01) )
    return (@discount != 0 ? "After the discount, the total comes to $#{@total.to_int}." : "There is no discount to apply.")
  end

  def void_last_transaction
    @total -= @item_prices.pop
  end

end
