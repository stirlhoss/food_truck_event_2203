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
end
