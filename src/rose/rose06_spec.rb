require 'rspec/given'
require 'rose'

describe InventoryItem do
  Given(:initial_quality) { 10 }
  Given(:initial_sell_in) { 5 }
  Given(:item) { InventoryItem.new("Bread", initial_quality, initial_sell_in) }

  describe "#has_quality?" do
    context "with quality" do
      Given(:initial_quality) { 1 }
      Then { item.should have_quality }
    end

    context "without quality" do
      Given(:initial_quality) { 0 }
      Then { item.should_not have_quality }
    end
  end

  describe "#daily_update" do
    When { item.daily_update }

    Invariant { item.sell_in.should == initial_sell_in - 1 }

    context "before the sell date" do
      Given(:initial_sell_in) { 1 }
      Then { item.quality.should == initial_quality - 1 }
    end

    context "on the sell date" do
      Given(:initial_sell_in) { 0 }
      Then { item.quality.should == initial_quality - 1 }
    end

    context "after the sell date" do
      Given(:initial_sell_in) { -1 }
      Then { item.quality.should == initial_quality - 2 }
    end

    context "at zero quality" do
      Given(:initial_quality) { 0 }
      Then { item.quality.should == 0 }
    end
  end
end
