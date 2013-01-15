require 'rspec/given'
require 'rose'
require 'flexmock'

RSpec.configure do |config|
  config.mock_with :flexmock
end
RSpec::Given.use_natural_assertions

describe InventoryItem do

  describe "#place_order" do
    Given(:fulfillment) { OrderSystem.new }
    Given(:item) { InventoryItem.new("Bread") }
    Given {
      flexmock(fulfillment)
        .should_receive(:order_item).with("Bread", 10).once
    }

    When { item.place_order(10, fulfillment) }

    Then { }
  end

  describe "#place_order" do
    Given(:fulfillment) { OrderSystem.new }
    Given(:item) { InventoryItem.new("Bread") }
    Given { flexmock(fulfillment, order_item: nil) }

    When(:result) { item.place_order(10, fulfillment) }

    Then {
      fulfillment.should have_received(:order_item)
        .with("Bread", 10).once
    }
  end

end
