class RestaurantBill
# The class should have the following attributes: ordered_items, tip and total
  attr_reader :ordered_items, :total, :tip

  def initialize
    @ordered_items = []
  end

  def order_item(item, cost)
    @ordered_items << [item, cost]
  end

#   A method that returns a total of all the item's costs combined, with tax
  def total
    @total = 0
    @ordered_items.each do |item|
      @total += item[1]
    end
    return @total
  end

  def tax
    @total * 0.096
  end

# A method to add a tip. Returns total with tip.
  def tip(percent)
    @tip = @total * percent
  end

# A way to see the final cost of a bill, with tax and tip
  def final_bill
    @total + tax + @tip
  end

end
