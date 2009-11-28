require File.join(File.dirname(__FILE__), '..', 'lib', 'scope')

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
	

	describe "given a derivative from Scope class" do
		before :each do
			Numbers = Class.new(Scope)
		end 
	end
end
