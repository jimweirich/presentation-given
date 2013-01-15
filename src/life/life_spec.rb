require 'rspec/given'

require 'life'

RSpec::Given.use_natural_assertions

describe Cell do
  Given(:start_alive) { false }
  Given(:cell) { Cell.new(start_alive) }

  Invariant { cell.dead? == !cell.alive? }

  Then { cell != nil }
  Then { cell.dead? }

  context "when created alive" do
    Given(:start_alive) { true }
    Then { cell.alive? }
  end

  context "when created dead" do
    Given(:start_alive) { false }
    Then { cell.dead? }
  end

  describe "detecting" do
    Given(:start_alive) { false }
    Given(:neighbors) { make_neighbors(3) }
    Given { cell.adopt(neighbors) }

    When { cell.detect }

    Then { cell.dead? }

    context "when " do
      When {
        neighbors.each do |n| n.alive = false end
        cell.update
      }
      Then { cell.alive? }
    end
  end

  describe "updating" do
    Given(:neighbors) { make_neighbors(live_count) }
    Given { cell.adopt(neighbors) }

    When { cell.detect; cell.update }

    context "when dead with too few neighbors" do
      Given(:start_alive) { false }
      Given(:live_count) { 2 }
      Then { cell.dead? }
    end

    context "when dead with 3 neighbors" do
      Given(:start_alive) { false }
      Given(:live_count) { 3 }
      Then { cell.alive? }
    end

    context "when dead with too many neighbors" do
      Given(:start_alive) { false }
      Given(:live_count) { 4 }
      Then { cell.dead? }
    end

    context "when alive with too few neighbors" do
      Given(:start_alive) { true }
      Given(:live_count) { 1 }
      Then { cell.dead? }
    end

    context "when alive with 2 neighbors" do
      Given(:start_alive) { true }
      Given(:live_count) { 2 }
      Then { cell.alive? }
    end

    context "when alive with 3 neighbors" do
      Given(:start_alive) { true }
      Given(:live_count) { 3 }
      Then { cell.alive? }
    end

    context "when alive with too many neighbors" do
      Given(:start_alive) { true }
      Given(:live_count) { 4 }
      Then { cell.dead? }
    end
  end

  private

  def make_neighbors(alive_count)
    (1..alive_count).map { Cell.live } +
      (1..(8-alive_count)).map { Cell.dead }
  end

end
