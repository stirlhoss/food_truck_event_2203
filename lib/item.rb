# lib/item.rb
require 'pry'

class Item
  attr_reader :name,
              :price

  def initialize(info)
    @name = info[:name]
    @price = info[:price]
  end
end
