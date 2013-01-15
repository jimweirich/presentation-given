class ApproximateNumber
  attr_reader :number, :delta

  def initialize(number, delta)
    @number = number
    @delta = delta
  end

  def ==(value)
    (number-value).abs <= delta
  end

  def coerce(other)
    puts "DBG: COERCE"
    [self, other]
  end

  def to_s
    "<Approximatly #{number} +/- #{delta}>"
  end
end

def about(n, delta)
  ApproximateNumber.new(n, delta)
end

# Expected this to work because of the == operator in
# ApproximateNumber.

about(10, 0.01) == 10 # => true

# Didn't expect this to work without some kind of coercion magic. But
# it does.

10.001 == about(10, 0.01) # => true
