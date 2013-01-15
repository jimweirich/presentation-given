require 'rspec/given'
require 'rose'

describe InventoryItem do

  describe "#price" do
    context "a normal item" do
      Given(:item) { InventoryItem.new("Bread", 10, 5) }
      When(:result) { item.price }
      Then { result == 100.00 }
    end

    describe "a metaphysical item" do
      Given(:item) { InventoryItem.new("Love", 10, 5) }
      it "raises an error" do
        expect {
          item.price
        }.to raise_error(InventoryItem::PriceError, /priceless/)
      end
    end

    describe "a metaphysical item" do
      Given(:item) { InventoryItem.new("Love", 10, 5) }
      When(:result) { item.price }
      Then { result.should have_failed(InventoryItem::PriceError, /priceless/) }
    end
  end
end
