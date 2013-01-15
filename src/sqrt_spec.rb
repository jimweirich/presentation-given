require 'rspec/given'

def sqrt(n)
  guess = n / 2.0
  while (guess*guess - n).abs > 0.00001
    guess = (guess + n / guess) / 2.0
  end
  guess
end

def sqrt2(n)
  Math::E ** (Math.log(n) / 2)
end

RSpec::Given.use_natural_assertions

class ApproximateNumber
  attr_reader :number, :delta

  def initialize(number, delta)
    @number = number
    @delta = delta
  end

  def ==(value)
    (number-value).abs <= delta
  end

  def to_s
    "<Approximatly #{number} +/- #{delta}>"
  end
end

def about(n, delta)
  ApproximateNumber.new(n, delta)
end

describe "sqrt" do
  Then { sqrt(0.0) == about(0, 0.00001) }
  Then { sqrt(36.0) == about(6, 0.00001) }
  Then { sqrt(1.0) == about(1, 0.00001) }
  Then { sqrt(100.0) == about(10, 0.00001) }
  Then { sqrt2(100.0) == about(10, 0.00001) }
end

10_000.times do
  n = rand * 100000
  if n >= 0
    result = sqrt(n)
    fail "FAILED" if (result**2 - n) > 0.0001
  end
end
