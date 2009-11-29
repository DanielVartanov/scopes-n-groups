require File.join(File.dirname(__FILE__), 'spec_helper')

describe Scope do
	describe "given a derivative from Scope class" do
		before :all do
			Numbers = Class.new(Scope)
		end

		describe "when #define_scope is called with a proc" do
			before :all do
				class Numbers
					define_scope :even, proc { |number| number % 2 == 0 }
					define_scope :odd, proc { |number| number % 2 != 0 }
				end
			end

			it "should return scoped elements according to given procs" do
				@numbers = Numbers.new((1..6).to_a)
				@numbers.even.should == [2, 4, 6]
				@numbers.odd.should == [1, 3, 5]
			end
		end
	end
end
