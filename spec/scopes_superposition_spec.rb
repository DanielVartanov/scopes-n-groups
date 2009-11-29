require File.join(File.dirname(__FILE__), 'spec_helper')

describe Scope do
	describe "given a Scope derivative with two defined scopes" do
		before :all do
			class Numbers < Scope
				define_scope :even, proc { |number| number.even? }
				define_scope :negative, proc { |number| number < 0 }
			end
		end
		
		describe "whe two scopes are called consequtively" do
			before :each do
				numbers = Numbers.new((-5..5).to_a)
				@scoped_numbers = numbers.even.negative
			end
			
			it "should apply both scopes" do
				@scoped_numbers.should == [-4, -2]
			end
		end
	end
end
