class OrderSystem
  def order_item(name, amount)
    # ... implementation details ...
    :ok
  end
  def to_s
    "OrderSystem"
  end
end

class InventoryItem
  PriceError = Class.new(StandardError)

  attr_reader :name, :quality, :sell_in

  def initialize(name, initial_quality=10, sell_in_days=5)
    @name = name
    @quality = initial_quality
    @sell_in = sell_in_days
  end

  def has_quality?
    quality > 0
  end

  def price
    raise PriceError, "Love is priceless" if name == "Love"
    10 * quality
  end

  def place_order(amount, fulfillment)
    fulfillment.order_item(name, amount)
  end

  def daily_update
    if has_quality?
      if sell_in < 0
        @quality -= 2
      else
        @quality -= 1
      end
    end
    @sell_in -= 1
  end
end
