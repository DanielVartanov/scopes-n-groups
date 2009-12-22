require File.join(File.dirname(__FILE__), 'spec_helper')

describe Scope do
	describe "given a derivative from Scope class" do
		before :all do
			Numbers = Class.new(Scope)
		end

		describe "when #define_mapping is called with a proc" do
			before :all do
				class Numbers
					define_mapping :multiplied_by_two, proc { |number| number * 2 }
				end
			end

			it "should return mapped elements according to given procs" do
				@numbers = Numbers.new((1..3).to_a)
				@numbers.multiplied_by_two.should == [2, 4, 6]
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
          define_mapping :sample_mapping, proc { local_method }
        end

        @numbers = Numbers.new ['anything-to-make-#select-call-the-block']
      end

      it "should call the proc in the instance context" do
        lambda { @numbers.sample_mapping }.should_not raise_error
      end
    end
  end
end
