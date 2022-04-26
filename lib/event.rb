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
end
