require File.join(File.dirname(__FILE__), 'spec_helper')

describe Scope do
	describe "given a Scope derivative with defined scopes and mappings" do
		before :all do
			class Numbers < Scope
				define_scope :even, proc { |number| number % 2 == 0 }
				define_scope :negative, proc { |number| number < 0 }

				define_mapping :added_by_one, proc { |number| number + 1 }
			end
		end
		
		describe "when two scopes are called consequtively" do
			before :each do
				numbers = Numbers.new((-5..5).to_a)
				@scoped_numbers = numbers.even.negative
			end
			
			it "should apply both scopes" do
				@scoped_numbers.should == [-4, -2]
			end
		end
		
		describe "when scopes and mappings are called consequtively" do
			before :each do
				@numbers = Numbers.new((1..5).to_a)
			end
			
			it "should apply mapping and scope in a right order" do
				@numbers.added_by_one.even.should == [2, 4, 6]
				@numbers.even.added_by_one.should == [3, 5]
			end
		end
	end
end
