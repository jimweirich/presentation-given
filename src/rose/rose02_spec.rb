require 'rspec/given'
require 'rose'

describe "#daily_update" do
  it "decreases the quality by 1 before the sell date" do
    item = InventoryItem.new("Bread", 10, 5)
    item.daily_update
    item.quality.should == 9
  end

  it "decreases in quality by 2 after the sell date" do
    item = InventoryItem.new("Bread", 10, -1)
    item.daily_update
    item.quality.should == 8
  end

  it "does not decrease quality when already at zero" do
    item = InventoryItem.new("Bread", 0, 5)
    item.daily_update
    item.quality.should == 0
  end

  it "decreases the sell_in count by 1" do
    item = InventoryItem.new("Bread", 10, 5)
    item.daily_update
    item.sell_in.should == 4
  end
end
