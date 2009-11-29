require File.join(File.dirname(__FILE__), 'spec_helper')

describe Scope do
	describe "when an instance is created" do
		before :each do
			@scope = Scope.new
		end

		it "should behave like Array" do
			@scope << 1
			@scope += [2]
			@scope.should == [1, 2]
		end
	end
end
