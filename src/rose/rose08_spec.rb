require 'rspec/given'
require 'rose'

RSpec::Given.use_natural_assertions

describe "Inventory Lists" do

  Given(:items) { [ :item1, :item2 ] }

  context "with some items" do
    class InventoryList
      attr_reader :items
      def initialize(items)
        @items = items
        @items.pop
      end
      def to_s
        "<InventoryList (#{items.map { |i| i.to_s }.join(',')})>"
      end
    end
    Given(:list) { InventoryList.new(items) }
    Then { list.should have(2).items }
    Then { list.items.size == 2 }
  end

  context "with a size method" do
    class InventoryListWithSize
      def size
        2
      end
    end
    Given(:list) { InventoryListWithSize.new }
    Then { list.should have(2).items }
  end

  context "with a length method" do
    class InventoryListWithLength
      def length
        2
      end
    end
    Given(:list) { InventoryListWithLength.new }
    Then { list.should have(2).items }
  end

  context "with a count method" do
    class InventoryListWithCount
      def count
        2
      end
    end
    Given(:list) { InventoryListWithCount.new }
    Then { list.should have(2).items }
  end

  context "with a all of the above" do
    class InventoryListWithAll
      def items
        [:a, :b, :c]
      end
      def size
        4
      end
      def length
        5
      end
      def count
        2
      end
    end
    Given(:list) { InventoryListWithCount.new }
    Then { list.should have(2).items }
  end

  context "with an array" do
    Given(:list) { items }
    Then { list.should have(2).items }
  end

end
