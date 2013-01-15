require 'rspec/given'
require 'rose'

describe "#daily_update" do
  let(:initial_quality) { 10 }
  let(:initial_sell_in) { 5 }
  let(:item) { InventoryItem.new("Bread", initial_quality, initial_sell_in) }

  context "before the sell date" do
    let(:initial_sell_in) { 1 }
    it "decreases the quality by 1" do
      item.daily_update
      item.quality.should == initial_quality - 1
    end
  end

  context "after the sell date" do
    let(:initial_sell_in) { -1 }
    it "decreases in quality by 2" do
      item.daily_update
      item.quality.should == initial_quality - 2
    end
  end

  context "at zero quality" do
    let(:initial_quality) { 0 }
    it "does not further decrease quality" do
      item.daily_update
      item.quality.should == 0
    end
  end

  it "decreases the sell_in count by 1" do
    item.daily_update
    item.sell_in.should == initial_sell_in - 1
  end
end
