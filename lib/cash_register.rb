require 'pry'

class CashRegister

  attr_accessor :discount, :total, :items, :history

  def initialize(discount = nil)
    @discount = discount
    @total = 0
    @items = []
    @history = []
  end

  def add_item(title, price, quantity = 1)
    @total += price*quantity
    quantity.times{@items << title}
    @history << [title, price, quantity]
  end

  def apply_discount
    if @discount
      @total -= @total * @discount / 100
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    last_price = @history[@history.length-1][1]
    last_quantity = @history[@history.length-1][2]
    @total -= last_price*last_quantity
  end


end