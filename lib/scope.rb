class Scope < Class.new(Array)

	def self.define_scope(name, proc)
		define_method name do
			scoped_elements = select { |element| proc.call(element) }
			self.class.new scoped_elements
		end
	end
	
	def self.define_mapping(name, proc)
		define_method name do
			mapped_elements = map { |element| proc.call(element) }
			self.class.new mapped_elements
		end
	end
end
