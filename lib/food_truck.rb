# lib/food_truck.rb
require 'pry'
require './lib/item'

class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new
  end

  def check_stock(item)
    if !inventory.include?(item)
      0
    else
    @inventory[item]
    end
  end

  def stock(item, quant)
    if @inventory[item].nil?
      @inventory[item] = quant
    else
    @inventory[item] += quant
    end
  end

  def potential_revenue
    total = 0
    @inventory.each do |item, quant|
      num = item.price.slice(1..4)
      total += num.to_f * quant
    end
    total
  end
end
