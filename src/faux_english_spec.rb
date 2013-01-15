require 'rspec/given'

class Container
  def things
    [1,2]
  end
end

class Sized
  def size
    2
  end
end

class SizedContainer
  def things
    Sized.new
  end
end

describe Container do

  context "with an array" do
    Given(:container) { [1,2] }
    Then { container.should have(2).things }
    Then { container.size == 2 }
  end

  context "a method that returns an array" do
    Given(:container) { Container.new }
    Then { container.should have(2).things }
    Then { container.things.size == 2 }
  end

  context "it has a size method" do
    Given(:container) { Sized.new }
    Then { container.should have(2).things }
    Then { container.size == 2 }
  end

  context "it a method that returns Sized things" do
    Given(:container) { SizedContainer.new }
    Then { container.should have(2).things }
    Then { container.things.size == 2 }
  end
end
