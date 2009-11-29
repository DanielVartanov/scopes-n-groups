class Scope < Class.new(Array)
	def self.define_scope(name, proc)
		define_method name do
			scoped_elements = select { |element| proc.call(element) }
			Numbers.new scoped_elements
		end
	end
end
