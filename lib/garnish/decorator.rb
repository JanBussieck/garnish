
module Decorator
	
	def self.for(model, view_context)
		view = view_context
		decorator_name = model.class.name + "Decorator"
		decorator = const_get(decorator_name)
		
		decorator.module_eval do 
			
			def helpers
					
			end

			def undecorated(method_call)
				#forward to super
				super.send(:method_call)
			end

		end

		decorator
	end

end