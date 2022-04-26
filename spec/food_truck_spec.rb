# food_truck_spec.rb
require 'pry'
require './lib/food_truck'

describe FoodTruck do
  it 'exists and has attricbutes' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_an_instance_of FoodTruck
    expect(food_truck.name).to eq "Rocky Mountain Pies"
  end

  it 'has an inventory that is empty when ititialized' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.inventory.class).to eq Hash
    expect(food_truck.inventory).to eq({})
  end

  it '#check_stock looks for an item in inventory and returns 0 if there is nothing there' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (slice)', price: '$3.75'})
    item2 = Item.new({name: 'Apple Pie (slice)', price: '$2.50'})

    expect(food_truck.check_stock(item1)).to eq 0
  end

  it '#stock will add items and an amount to inventory' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (slice)', price: '$3.75'})
    item2 = Item.new({name: 'Apple Pie (slice)', price: '$2.50'})
    food_truck.stock(item1, 30)

    expect(food_truck.check_stock(item1)).to eq 30
  end

  it 'can check and stock mutliple items and increments current stock when added' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (slice)', price: '$3.75'})
    item2 = Item.new({name: 'Apple Pie (slice)', price: '$2.50'})
    food_truck.stock(item1, 30)
    food_truck.stock(item1, 25)

    expect(food_truck.check_stock(item1)).to eq 55

    food_truck.stock(item2, 12)

    expect(food_truck.check_stock(item2)).to eq 12
    expect(food_truck.inventory).to eq({item1 => 55,
                                        item2 => 12})

  end

  it 'can calculate potential revenue' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (slice)', price: '$3.75'})
    item2 = Item.new({name: 'Apple Pie (slice)', price: '$2.50'})
    food_truck.stock(item1, 30)
    food_truck.stock(item1, 25)
    food_truck.stock(item2, 12)

    expect(food_truck.potential_revenue).to eq 236.25
  end
end
