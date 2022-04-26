# lib/event.rb
require 'pry'
require './lib/food_truck'

class Event
  attr_reader :name,
              :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = Array.new
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map { |truck| truck.name }
  end

  def food_trucks_that_sell(item)
    trucks = []
    @food_trucks.each do |truck|
      trucks << truck if truck.inventory.include?(item)
    end
    trucks
  end

  def sorted_item_list
    items = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quant|
        items << item if !items.include?(item)
      end
    end
    items.sort_by { |item| item.name }
  end

  def overstocked_items
    search = items_at_mult_trucks
    sum = {}
    overstocked = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quant|
        if search.include?(item)
          if sum.keys.include?(item)
            sum[item] += quant
          else
            sum[item] = quant
          end
        end
      end
    end
    sum.each do |item, quant|
      overstocked << item if quant > 50
    end
    overstocked
  end

  def items_at_mult_trucks
    items_at_mult_trucks = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quant|
        items_at_mult_trucks << item if food_trucks_that_sell(item).length > 1 && !items_at_mult_trucks.include?(item)
      end
    end
    items_at_mult_trucks
  end

  def total_inventory
    total_inv = {}
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quant|
        if !total_inv.empty?
        total_inv[item]
        else
        total_inv[item] = {:quantity => quant, :food_trucks => food_trucks_that_sell(item)}
        end
      end
    end
total_inv
  end
end
