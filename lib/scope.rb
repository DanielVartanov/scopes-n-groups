class Scope < Class.new(Array)
	def self.define_scope(name, proc)
		define_method name do
			scoped_elements = select { |element| self.instance_exec(element, &proc) }
			self.dup.replace scoped_elements
		end
	end

	def self.define_mapping(name, proc)
		define_method name do
			mapped_elements = map { |element| self.instance_exec(element, &proc) }
      self.dup.replace mapped_elements
		end
	end
end
