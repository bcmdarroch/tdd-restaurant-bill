class RestaurantBill
  attr_reader :ordered_items

  def initialize
    @ordered_items = []
  end

  def order_item(item, cost)
    @ordered_items << [item, cost]
  end

end
