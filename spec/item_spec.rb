# item_spec.rb
require 'pry'
require './lib/item'

describe Item do
  it 'exists and has attributes' do
    item1 = Item.new({name: 'Peach Pie (slice)', price: '$3.75'})

    expect(item1).to be_an_instance_of Item
    expect(item1.name).to eq 'Peach Pie (slice)'
    expect(item1.price).to eq '$3.75'
  end
end
