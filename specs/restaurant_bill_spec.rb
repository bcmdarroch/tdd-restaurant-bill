require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/restaurant_bill'

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe RestaurantBill do

  before do
    @my_bill = RestaurantBill.new
  end

  it "RestaurantBill is created with an empty ordered_items" do
    @my_bill.ordered_items.must_be_instance_of Array
    @my_bill.ordered_items.length.must_equal 0
    @my_bill.ordered_items.empty?.must_equal true
  end

  it "order_item adds item and cost to bill" do
    @my_bill.order_item("Pike Place Chowder", 8.5)
    @my_bill.ordered_items.must_include ["Pike Place Chowder", 8.5]
  end

  it "order_item adds multiple orders into ordered_items" do
    my_order = ["Pike Place Chowder", 8.5]
    addie_order = ["New England Clam Chowder", 7.5]
    rana_order = ["Salmon & Tomato Chowder", 10.5]

    @my_bill.order_item(my_order[0], my_order[1])
    @my_bill.order_item(addie_order[0], addie_order[1])
    @my_bill.order_item(rana_order[0], rana_order[1])

    @my_bill.ordered_items.must_include my_order
    @my_bill.ordered_items.must_include addie_order
    @my_bill.ordered_items.must_include rana_order
  end

  it "Calculate sub-total with tax" do
    my_order = ["Pike Place Chowder", 8.5]
    addie_order = ["New England Clam Chowder", 7.5]
    rana_order = ["Salmon & Tomato Chowder", 10.5]

    @my_bill.order_item(my_order[0], my_order[1])
    @my_bill.order_item(addie_order[0], addie_order[1])
    @my_bill.order_item(rana_order[0], rana_order[1])

    @my_bill.total_bill.must_equal 29.044
  end
end
