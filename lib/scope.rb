class Scope < Class.new(Array)
	def self.define_scope(name, proc)
		define_method name do
			select { |element| proc.call(element) }
		end
	end
end
