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

  describe "given Scope descendant with a local method" do
    before :all do
      class Numbers < Scope
        def local_method; end
      end
    end

    describe "when given proc calls this local stuff" do
      before :all do
        class Numbers
          define_scope :sample_scope, proc { local_method }
        end

        @numbers = Numbers.new ['anything-to-make-#select-call-the-block']
      end

      it "should call the proc in the instance context" do
        lambda { @numbers.sample_scope }.should_not raise_error
      end
    end
  end
end
