class RestaurantBill
  attr_reader :ordered_items, :total, :tip_amount

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
    total * 0.096
  end

# A method to add a tip. Returns total with tip.
  def tip(percent)
    @tip_amount = total * percent
  end

# A way to see the final cost of a bill, with tax and tip
  def final_bill
    total + tax + @tip_amount
  end

end

# my_bill = RestaurantBill.new
# my_bill.order_item("Pike Place Chowder", 8.5)
# my_bill.order_item("New England Clam Chowder", 7.5)
# my_bill.order_item("Salmon & Tomato Chowder", 10.5)
#
# my_bill.tip(0.2)
# puts "Tip: #{my_bill.tip_amount}"
# puts "Tax: #{my_bill.tax}"
# puts "Total: #{my_bill.total}"
