def classify(a,b,c)
  n = [a,b,c].uniq.length
  case n
  when 1
    :equilateral
  when 2
    :isosceles
  end
end

require 'rspec/given'

describe "classify" do
  Then { classify(3,3,3).should == :equilateral }
  Then { classify(3,3,2).should == :isosceles }
end
